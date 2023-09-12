#!/usr/bin/env bash

set -e

echo "Installing gfortran"
apt-get install -qy gfortran


echo "Install FSPS"
git clone https://github.com/cconroy20/fsps
cd fsps/src
make all
cd /tmp
mkdir -p /opt/
mv fsps /opt/

echo "Installing python bindings"

# You can specify here the libraries that you need.
#
# FFLAGS="-DMIST=0 -DPADOVA=1 -DMILES=0 -DBASEL=1" pip install fsps --no-binary fsps
#
pip install fsps

rm install_fsps.sh
echo "FSPS installed!"
