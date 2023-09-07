FROM python:3.11-bullseye

# Update sys
RUN apt-get update && apt-get upgrade -qy

# Install basic system packages
RUN apt-get install -qy libblas3 libblas-dev liblapack3 liblapack-dev libatlas3-base libatlas-base-dev cmake build-essential git gfortran

# Installing Multinest
COPY install_multinest.sh .
RUN ./install_multinest.sh

# Installing PyMultinest
RUN pip install pymultinest bagpipes

# Installing python packages
WORKDIR /tmp/
COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt


# Setting workspace
RUN mkdir /opt/code/
WORKDIR /opt/code