# jsrun

- [jsrun](#jsrun)
  - [Resource Set (RS)](#resource-set-rs)
  - [Options](#options)
  - [Verify layout](#verify-layout)
    - [2 nodes, 4 ranks, without `-r2`](#2-nodes-4-ranks-without--r2)
    - [2 nodes, 4 ranks, with `-r2`](#2-nodes-4-ranks-with--r2)
  - [bsub options](#bsub-options)

## Resource Set (RS)

* A resource set is a group of resources (GPU, CPU, RAM) _within_ a node.
* A resource set can’t span socket, can’t span node.
* All resource sets within a `jsrun` must be the same.
* On CPU, the granularity is on the entire core, not hyper thread level.


## Options

* `-n`: number of resource set
* `-c`: number of physical cores per resource set
* `-g`: number of gpus per resource set
* `-a`: number of tasks per resource set
* `-r`: number of resource per node

## Verify layout

[Hello jsrun](https://code.ornl.gov/t4p/Hello_jsrun) can really be your friend.
The following examples are from Summit interactive shell with 2 nodes allocated.

### 2 nodes, 4 ranks, without `-r2` 

```sh
export OMP_NUM_THREADS=1
jsrun -n4 -c1 -a1 ./hello_jsrun | sort

MPI Rank 000 of 004 on HWThread 000 of Node h30n16, OMP_threadID 0 of 1
MPI Rank 001 of 004 on HWThread 004 of Node h30n16, OMP_threadID 0 of 1
MPI Rank 002 of 004 on HWThread 009 of Node h30n16, OMP_threadID 0 of 1
MPI Rank 003 of 004 on HWThread 012 of Node h30n16, OMP_threadID 0 of 1
```

All ranks are allocated on the first node; probably not what we want.

### 2 nodes, 4 ranks, with `-r2`

```sh
jsrun -n4 -c1 -a1 -r2 ./hello_jsrun | sort

MPI Rank 000 of 004 on HWThread 001 of Node h30n16, OMP_threadID 0 of 1
MPI Rank 001 of 004 on HWThread 004 of Node h30n16, OMP_threadID 0 of 1
MPI Rank 002 of 004 on HWThread 001 of Node h30n17, OMP_threadID 0 of 1
MPI Rank 003 of 004 on HWThread 005 of Node h30n17, OMP_threadID 0 of 1
---------- MPI Ranks: 4, OpenMP Threads: 1, GPUs per Resource Set: 0 ----------
```

## bsub options

```sh 
#!/bin/bash
#BSUB -P stf008                # project ID 
#BSUB -J name_test             # name of the job 
#BSUB -o nvme_test.o%J         # output file
#BSUB -W 2                     # wallclock hrs
#BSUB -nnodes 2                # num. of nodes requested
#BSUB -alloc_flags NVME        # if u plan to use NVME
```
