#!/bin/bash
set -e
set -x

export CC=$(basename $CC)
export CPP=$(basename $CPP)
export CXX=$(basename $CXX)
export STRIP=$(basename $STRIP)
export NM=$(basename $NM)
export OBJDUMP=$(basename $OBJDUMP)
export AS=$(basename $AS)
export AR=$(basename $AR)
export RANLIB=$(basename $RANLIB)
export LD=$(basename $LD)

./configure --prefix="$PREFIX" --disable-install-doc --enable-load-relative \
  --enable-shared --with-openssl-dir="$PREFIX" --with-readline-dir="$PREFIX" \
  --with-tcl-dir="$PREFIX" --with-tk-dir="$PREFIX" --with-libyaml-dir="$PREFIX" \
  --with-zlib-dir="$PREFIX"
make -j ${CPU_COUNT}
make install
