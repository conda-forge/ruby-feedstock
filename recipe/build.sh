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

# Remove vendored libffi
rm -rf ext/fiddle/libffi-3.2.1

if [[ "$(uname)" == "Darwin" ]]; then
    ln -sfv "$(which $LIBTOOL)" "$BUILD_PREFIX/bin/libtool"
fi

autoconf

./configure \
  --prefix="$PREFIX" \
  --disable-install-doc \
  --enable-load-relative \
  --enable-shared \
  --with-libffi-dir="$PREFIX" \
  --with-libyaml-dir="$PREFIX" \
  --with-openssl-dir="$PREFIX" \
  --with-readline-dir="$PREFIX" \
  --with-zlib-dir="$PREFIX"

make -j ${CPU_COUNT}
# make check works locally on Linux, but not on CI Nodes, issue seems related to IPv6 and closed ports
# make check
make install
