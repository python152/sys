#!/bin/bash


installDIR="/usr/local"

cd /tmp
# Build using maximum number of physical cores
n=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk '{print $NF}'`

# grab the necessary files
wget http://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.4.tar.gz
tar xzvf openmpi-1.6.4.tar.gz
cd openmpi-1.6.4

echo "Beginning the installation..."
./configure --prefix=$installDIR
make -j $n
make install

sudo ldconfig
echo

echo "...done."

