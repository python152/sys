# IOR

A cheat sheet for often used options

* `-r`: perform read
* `-w`: perform write
* `-i 3`: iterate 3 times
* `-F`: file per process when present, otherwise, it is shared file test
* `-t 16m`: individual transfer size is 16m 
* `-b 32g`: transfer data size is 32g, this is per rank
* `-a [POSIX|MPIIO|HDF5]`: I/O interface to use
* `-C`: reorder tasks for read back, used with `-r` option.
* `-g`: use barrier in between open, read/write, and close.
* `-k`: keep file


## Less used options

* `-s 16`: segment count, use 16 segments; This will test stride read and write. The total data volume is calculated by: `nprocs * transfer size * segment number`.


