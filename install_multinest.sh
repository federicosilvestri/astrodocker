#!/usr/bin/env bash
set -e

cd /tmp
git clone https://github.com/JohannesBuchner/MultiNest
cd MultiNest
mkdir -p build && cd build
cmake ..
make
make install

# Update the cache of dynamic linker (instead of exporting variabe LD_LIBRARY_PATH)
ldconfig

cd /tmp && rm -rf /tmp/MultiNest