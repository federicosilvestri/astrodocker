#!/usr/bin/env bash

set -e

echo "Retrieving HDF5 from archive"

cd /tmp/
wget https://hdf-wordpress-1.s3.amazonaws.com/wp-content/uploads/manual/HDF5/HDF5_1_14_2/src/hdf5-1.14.2.tar.gz -O hdf5.tar.gz
mkdir download
tar -xzvf hdf5.tar.gz -C download && rm hdf5.tar.gz
mv download/$(ls download) hdf5
rm -rf download

cd hdf5

echo "Configuring the compiler"
./configure --prefix=/usr/local --enable-cxx --enable-build-mode=production
echo "Compiling HDF5 Library with 16 jobs"
make -j 16

echo "Installing HDF5"
make install
echo "Testing installation"
make check-install
echo "/usr/local/lib" > /etc/ld.so.conf.d/h5.conf
ldconfig

cd .. && rm -rf /tmp/hdf5
echo "HDF5 Installed!"



