#!/bin/bash

VER="4.7.5"

yum --enablerepo=elrepo-kernel install kernel-ml-${VER}
yum --enablerepo=elrepo-kernel install kernel-ml-devel-${VER}
yum --enablerepo=elrepo-kernel install kernel-ml-doc-${VER}
yum --enablerepo=elrepo-kernel install perf-${VER}
yum --enablerepo=elrepo-kernel install python-perf-${VER}

