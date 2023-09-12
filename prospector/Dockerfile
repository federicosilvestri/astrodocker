FROM python:3.11-bullseye

# Update sys
RUN apt-get update && apt-get upgrade -qy

# Installing system packages
RUN apt-get install -qy build-essential git wget


# Temporary workdir
WORKDIR /tmp/

# Installing OpenMPI
COPY install_openmpi.sh .
RUN ./install_openmpi.sh

# Installing HDF5
COPY install_hdf5.sh .
RUN ./install_hdf5.sh && rm ./install_hdf5.sh


# Installing FSPS
COPY install_fsps.sh .
RUN ./install_fsps.sh
# Add the FSPS homepath to environment 
ENV SPS_HOME "/opt/fsps/"
RUN echo "export SPS_HOME=/opt/fsps/" >> .bashrc


# Installing python packages
COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt


# Setting workspace
RUN mkdir /opt/code/
WORKDIR /opt/code
