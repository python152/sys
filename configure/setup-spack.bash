
if [ -d ~/spack-0.11.2 ]; then
    echo "Found spack"
    export PATH=~/spack-0.11.2/bin:$PATH
    source ~/spack-0.11.2/share/spack/setup-env.sh
else
    echo "Can not locate spack"
fi


