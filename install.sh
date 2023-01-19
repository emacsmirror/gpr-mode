#!/bin/sh
# Install executables for Gpr mode.
# 
# $1 : optional --prefix=<dir>
#   
# See build.sh for build (must be run before install).

if [ x$1 = x ]; then
    PREFIX=$HOME/.local        
    # as recommended by https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
else
    PREFIX=$1
fi
    
echo "installing gpr-mode executables to" $PREFIX/bin

# No need for gprinstall; we only need the executables

mkdir -p $PREFIX/bin

if type alr; then
    cp emacs_gpr_mode*/bin/* $PREFIX/bin

elif type gprbuild; then
    cp bin/* $PREFIX/bin

else
    echo "neither Alire nor gnat compiler found"
    return 1
fi

# end of file.
