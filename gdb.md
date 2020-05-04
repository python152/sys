# GDB

- [GDB](#gdb)
  - [Compile with a different compiler](#compile-with-a-different-compiler)
  - [Compile with debug information](#compile-with-debug-information)
  

## Compile with a different compiler

```sh
./configure CC=/usr/local/bin/gcc-9
```

## Compile with debug information

```sh
./configure CFLAGS="-g -O2"
```

Note that flags can be combined as needed.

