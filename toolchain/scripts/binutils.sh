#!/usr/bin/env bash
set -e

if [ -f binutils_configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    sh $SRC_DIR/binutils/configure --host=$HOST --build=$BUILD --target=$TARGET --with-sysroot=$PREFIX --prefix=$PREFIX \
                                   --with-libiconv-prefix=$GCC_LIBS --with-libexpat-prefix=$GCC_LIBS \
                                   $GNU_EXTRA_OPTIONS \
                                   $GNU_MULTILIB \
                                   $GNU_WIN32_OPTIONS \
                                   CFLAGS="$BUILD_CFLAGS_LTO" LDFLAGS="$BUILD_LDFLAGS_LTO" \
                                   > $LOG_DIR/binutils_configure.log 2>&1 || exit 1
    echo "--> Configured"
fi
touch binutils_configure.marker

if [ -f binutils_build.marker ]
then
    echo "--> Already built"
else
    echo "--> Building"
    make $MAKE_OPTS > $LOG_DIR/binutils_build.log 2>&1 || 
exit 1
fi
touch binutils_build.marker
if [ -f binutils_install.marker ]
then
    echo "--> Already installed"
else
    echo "--> Installing"
    make $MAKE_OPTS install-strip > $LOG_DIR/binutils_install.log 2>&1 || exit 1
fi
touch binutils_install.marker