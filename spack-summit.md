
The following note is more relevant to Summit as I do use `spack` for 3rd party packages. For [Rhea](https://docs.olcf.ornl.gov/systems/rhea_user_guide.html), Homebrew turns out to be a pretty decent option with x86_64 platform support.

## Preparation

Download a spack release and unzip to home

    ln -sf spack-0.14.2 spack
    export PATH=$HOME/spack/bin:$PATH
  
Now we have `spack` command.


## Set default compiler

The first thing we want to do is compiler configuration. This can be done by:

    spack compiler add

The list can be fine tuned by:

    spack config edit compilers
    

```
$ cat .spack/packages.yaml
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


