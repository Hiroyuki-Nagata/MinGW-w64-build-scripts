#!/usr/bin/env bash
set -e

if [ -f $MARKER_DIR/gmp_configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    sh ../../src/gmp-$GMP_VERSION/configure --host=$HOST --build=$BUILD --prefix=$GCC_LIBS \
                                            $SHARED --disable-static --enable-cxx --with-gmp-libraries=/home/ruben/Development/cross64/mingw64/lib/gcc/x86_64-w64-mingw32/4.6.1 \
                                            CFLAGS="$BUILD_CFLAGS_LTO" LDFLAGS="$BUILD_LDFLAGS_LTO" \
                                            > $LOG_DIR/gmp_configure.log 2>&1 || exit 1
    echo "--> Configured"
fi
touch $MARKER_DIR/gmp_configure.marker

if [ -f $MARKER_DIR/gmp_build.marker ]
then
    echo "--> Already built"
else
    echo "--> Building"
	make $MAKE_OPTS > $LOG_DIR/gmp_build.log 2>&1 || exit 1
fi
touch $MARKER_DIR/gmp_build.marker
if [ -f $MARKER_DIR/gmp_install.marker ]
then
    echo "--> Already installed"
else
	echo "--> Installing"
	make $MAKE_OPTS install > $LOG_DIR/gmp_install.log 2>&1  || exit 1
fi
touch $MARKER_DIR/gmp_install.marker