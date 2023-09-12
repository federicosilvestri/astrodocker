# Docker Images for Astrophysics

Very simple docker images with bagpipes and prospector, optimized.


### Usage

Build using `docker build bagpipes -t bagpipes` an then 
`docker run -it bagpipes /bin/bash`.

Or `docker build prospector -t prospector` an 
then `docker run -it prospector /bin/bash`.


You can use Docker volumes if you want to have persistent data or you have to
share files with containers.


### FSPS tips

If you need more (or less) libraries, 
as specified [here](https://dfm.io/python-fsps/current/installation/#choosing-stellar-libraries),
you need to adjust the script `install_fsps.sh` inside prospector folder.

