# Docker image for Multinest and BagPipes

Very simple docker image with python, multinest and bagpipes.
Build using `docker build bagpipes -t bagpipes` an then `docker run -it bagpipes /bin/bash`.
Or `docker build prospector -t prospector` an then `docker run -it prospector /bin/bash`.

You can also use docker-compose for volumes.


# FSPS tips

If you need to other libraries, as specified [here](https://dfm.io/python-fsps/current/installation/#choosing-stellar-libraries),
you need to adjust the script `install_fsps.sh` inside prospector folder.

