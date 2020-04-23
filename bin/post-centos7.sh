#!/bin/bash

sudo yum install -y  \
    epel-release \
	automake autoconf libtool \
	git bison flex   \
	ctags cscope  perf \
	openmpi-devel  hdf5-devel  hdf5-openmpi \
	cmake \
	gcc-c++  \
	cppunit-devel \
	glog-devel  snappy-devel leveldb-devel \
	protobuf-devel  \
	python-virtualenv python-pip libffi-devel h5py \
	rpm-build rpmdevtools redhat-rpm-config \
	tmux lftp pdsh mock
