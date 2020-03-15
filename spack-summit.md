


## Set default compiler

```
$ cat packages.yaml
packages:
    all:
        compiler: [gcc@6.4.0]
```

## Using a different install tree

```
cat .spack/config.yaml
config:
    install_tree: /sw/exp9
    module_roots:
        tcl:    /sw/exp9/spack/modules
        dotkit: /sw/exp9/spack/dotkit
        lmod:   /sw/exp9/spack/lmod
```

Check  what compilers you are using manually

    # cat .spack/linux/compilers.yaml


## Specify Dependencies

I want protobuf to use existing setup of cmake, gcc;

    # spack install protobuf ^cmake@3.9.2 %gcc@6.4.0

## Detecting and Using Compiler

## Check what compilers are available

	# spack compilers

Assume you have loaded new modules (gcc)
will auto detect new compilers in the path

    # spack compiler add


To check details on the compilers configured:

	# spack config edit compilers


To install a package with particular compiler

	# spack install protobuf %gcc@6.3.1

This is to install protobuf using gcc 6.3.1



## Install Packages


	# spack install gcc@6.4.0
	# spack install 


