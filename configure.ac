#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([MinGW-w64-build-scripts], [1.0.0], [newserver002@gmail.com])
AM_INIT_AUTOMAKE([foreign])

# Checks for programs.
AC_CONFIG_MACRO_DIR([m4])
AM_PROG_MKDIR_P

# Checks for programs.
AC_PROG_CC
AC_PROG_CXX
AC_PROG_MAKE_SET

# Check for flex and bison
AC_PROG_YACC
AC_PROG_LEX

AC_DEFUN([AC_PROG_BISON], [AC_CHECK_PROGS(BISON, bison, bison)]) 
AS_IF([test "x$ac_cv_prog_YACC" != "xbison -y"],[
	    AC_MSG_ERROR([Bison is required to compile MinGW. Make sure it is installed and in the PATH.])
])

AS_IF([test "x$ac_cv_prog_LEX" != "xflex"],[
	AC_MSG_ERROR([Flex is required to compile MinGW. Make sure it is installed and in the PATH.])
])

# Check for git/svn
AC_CHECK_TOOL([GIT], [git], [
	AC_MSG_ERROR([Git is required to compile MinGW. Make sure it is installed and in the PATH.])
], [])
AC_CHECK_TOOL([SVN], [svn], [
	AC_MSG_ERROR([Subversion is required to compile MinGW. Make sure it is installed and in the PATH.])
], [])

#-----------------------------------------------------------------------
# GCC target setting
#
AC_ARG_WITH([gcc-],
  AS_HELP_STRING([--with-gcc=4.7.0|4.7.1|4.7.2|4.7.3|4.7.4|4.8.0|4.8.1|4.8.2|4.8.3|4.9.0|HEAD],
		 [which gcc version to compile against (default: 4.8.3)]),
  [case "$with_gcc" in
      4.7.0) TARGET_GCC_VER=$with_gcc ;;
      4.7.1) TARGET_GCC_VER=$with_gcc ;;
      4.7.2) TARGET_GCC_VER=$with_gcc ;;
      4.7.3) TARGET_GCC_VER=$with_gcc ;;
      4.7.4) TARGET_GCC_VER=$with_gcc ;;
      4.8.0) TARGET_GCC_VER=$with_gcc ;;
      4.8.1) TARGET_GCC_VER=$with_gcc ;;
      4.8.2) TARGET_GCC_VER=$with_gcc ;;
      4.8.3) TARGET_GCC_VER=$with_gcc ;;
      4.9.0) TARGET_GCC_VER=$with_gcc ;;
      HEAD)  TARGET_GCC_VER=$with_gcc ;;

     *) AC_MSG_ERROR([invalid gtk+ version specified]);;
  esac],
  [with_gcc=4.8.3
   TARGET_GCC_VER=4.8.3
   LIBICONV_VERSION=1.14
   EXPAT_VERSION=2.1.0
   GMP_VERSION=5.1.2
   MPFR_VERSION=3.1.2
   MPC_VERSION=1.0.1
   PPL_VERSION=1.0
   CLOOG_VERSION=0.18.1
   MAKE_VERSION=4.0
   ISL_VERSION=0.12.2
  ])

# MinGW GCC version
AC_SUBST([TARGET_GCC_VER])

# MinGW dependency library
AC_SUBST([LIBICONV_VERSION])
AC_SUBST([EXPAT_VERSION])
AC_SUBST([GMP_VERSION])
AC_SUBST([MPFR_VERSION])	 
AC_SUBST([MPC_VERSION]) 
AC_SUBST([PPL_VERSION])	 
AC_SUBST([CLOOG_VERSION])	 
AC_SUBST([MAKE_VERSION])
AC_SUBST([ISL_VERSION]) 

AC_CONFIG_FILES([packages/Makefile
		 Makefile])
AC_OUTPUT

# Trace all options
AC_MSG_RESULT([])
AC_MSG_RESULT([Build with below environment...])
AC_MSG_RESULT([CC		: $CC])
AC_MSG_RESULT([CXX		: $CXX])
AC_MSG_RESULT([CPPFLAGS	: $CPPFLAGS])
AC_MSG_RESULT([CXXFLAGS	: $CXXFLAGS])
AC_MSG_RESULT([LIBS		: $LIBS])
AC_MSG_RESULT([TARGET_GCC_VER	: $TARGET_GCC_VER])