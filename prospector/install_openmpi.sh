#!/usr/bin/env bash

set -e

echo "Getting OpenMPI from archive"
wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.5.tar.gz -O openmpi.tar.gz
mkdir download
tar -xvf openmpi.tar.gz -C download && rm openmpi.tar.gz
mv download/$(ls download/) openmpi
rm -rf download
cd openmpi

echo "Configuring compiler"
./configure --prefix=/usr/local

echo "Compiling OpenMPI"
make -j16 all
make install
ldconfig -v
cd ..
rm -rf openmpi

echo "Installing mpi4py"

MPICC=$(which mpicc) pip install mpi4py

rm install_openmpi.sh

echo "OpenMPI installed!"