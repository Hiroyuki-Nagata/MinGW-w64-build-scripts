#!/usr/bin/env bash
set -e

# versions of different packages (prefix RUBENVB to prevent conflict with macros)
export RUBENVB_GCC_VERSION="4.8.2"
export RUBENVB_CLANG_VERSION="3.2pre"

export RUBENVB_PACKAGE_OPTIONS="--with-pkgversion=hiroyuki-$RUBENVB_GCC_VERSION --with-bugurl=mingw-w64-public@lists.sourceforge.net"

# this is hiroyuki nagata's library version setting
export LIBICONV_VERSION="1.14"
export EXPAT_VERSION="2.1.0"
export GMP_VERSION="5.1.2"
export MPFR_VERSION="3.1.2"
export MPC_VERSION="1.0.1"
export PPL_VERSION="1.0"
export CLOOG_VERSION="0.18.1"
export MAKE_VERSION="4.0"
export ISL_VERSION="0.12.2"