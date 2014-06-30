#
# MinGW dependency libraries
#
NLIST = $(shell for x in {1..$(words $(DEPS))}; do echo $$x; done)
VLIST = $(shell for x in {1..$(words $(VCSS))}; do echo $$x; done)

### dependency, download by archive ###
DEPS = libiconv expat gmp mpfr mpc cloog make isl

VERS = @LIBICONV_VERSION@ \
	@EXPAT_VERSION@	  \
	@GMP_VERSION@	  \
	@MPFR_VERSION@	  \
	@MPC_VERSION@	  \
	@CLOOG_VERSION@	  \
	@MAKE_VERSION@	  \
	@ISL_VERSION@

EXTS = .tar.gz   \
	.tar.gz  \
	.tar.bz2 \
	.tar.gz  \
	.tar.gz  \
	.tar.gz  \
	.tar.gz	 \
	.tar.gz

URLS = http://ftp.gnu.org/pub/gnu/libiconv                                     \
	http://sourceforge.net/projects/expat/files/expat/$(word $(x),$(VERS)) \
	http://mirror.internode.on.net/pub/gnu/gmp                   \
	https://ftp.gnu.org/gnu/mpfr                                 \
	http://www.multiprecision.org/mpc/download                   \
	http://www.bastoul.net/cloog/pages/download/count.php3?url=. \
	http://ftp.gnu.org/gnu/make                                  \
	http://isl.gforge.inria.fr

### dependency, download by vcs ###
VCSS = ppl binutils gdb mingw-w64 gcc LLVM LLVM/tools/clang

VVER = @PPL_VERSION@        \
	@BINUTILS_VERSION@  \
	@GDB_VERSION@	    \
	@MINGW_W64_VERSION@ \
	@TARGET_GCC_VER@    \
	@LLVM_VERSION@	    \
	@CLANG_VERSION@

TYPS = git git git git git svn svn

VCURLS = git://git.cs.unipr.it/ppl/ppl.git \
	 git://sourceware.org/git/binutils.git	     \
	 git://sourceware.org/git/gdb.git	     \
	 git://git.code.sf.net/p/mingw-w64/mingw-w64 \
	 git://gcc.gnu.org/git/gcc.git		     \
	 http://llvm.org/svn/llvm-project/llvm/trunk \
	 http://llvm.org/svn/llvm-project/cfe/trunk 


### main logic ###
all: prepare fetch vc compile

prepare:
	@if test ! -d $(top_builddir)/src/@TARGET_GCC_VER@; then \
	   mkdir -p $(top_builddir)/src/@TARGET_GCC_VER@;        \
	   echo "update sources for gcc-@TARGET_GCC_VER@";       \
	fi

fetch:
	@$(foreach x,$(NLIST),                                              \
	mkdir -p $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS)); \
	echo "-> $(word $(x),$(DEPS)), version $(word $(x),$(VERS))";	    \
	echo "-> Checking exists of $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))"; \
	if test ! -d "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))-$(word $(x),$(VERS))"; then \
	   if test -e "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))"; then \
	      echo "--> Source is already up to date, Extracting...";           \
	      rm -rf "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-*/"; \
	      tar -xf $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS)) \
	          -C $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/;                                                              \
	   else                                                                                                                    \
	      echo "--> Removing old versions";                                                                                    \
	      rm -rf "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-*";                           \
	      echo "--> Downloading version $(word $(x),$(VERS))";		    \
	      echo "----> wget -v $(word $(x), $(URLS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS)) -O \
		$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))"; \
	      wget -v "$(word $(x), $(URLS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))" -O				\
	      "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))" \
	      > /dev/null 2>&1 || exit 1; \
	      echo "--> Extracting... cd $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))";	  \
	      cd $(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(DEPS))/ ; \
	      tar -xf "$(word $(x),$(DEPS))-$(word $(x),$(VERS))$(word $(x),$(EXTS))" || exit 1; \
	      cd -; \
	   fi; \
	fi; \
	echo "--> Up to date"; \
	)

vc:
	@$(foreach x, $(VLIST), \
	echo "-> $(word $(x),$(VCSS)), from version control"; \
	if test ! -d "$(top_builddir)/src/@TARGET_GCC_VER@/$(word $(x),$(VCSS))"; then \
	   echo "-> $(word $(x),$(VCSS))";                         \
	   if test "$(word $(x),$(TYPS))" = "git"; then            \
	      echo "--> cd $(top_builddir)/src/@TARGET_GCC_VER@/"; \
	      cd $(top_builddir)/src/@TARGET_GCC_VER@/;            \
	      git clone --depth=1 $(word $(x),$(VCURLS)) || exit 1; \
	      cd -; \
	   fi;      \
	   if test "$(word $(x),$(TYPS))" = "svn"; then \
	      echo "--> cd $(top_builddir)/src/@TARGET_GCC_VER@/"; \
	      cd $(top_builddir)/src/@TARGET_GCC_VER@/; \
	      svn co $(word $(x),$(VCURLS)) $(word $(x),$(VCSS)) || exit 1; \
	      cd -; \
	   fi;      \
	fi;         \
	)

compile:
	echo "Building linux 64-bit to Windows 32-bit cross-compiler"
	cd $(top_builddir)/target-scripts
	sh $(top_builddir)/target-scripts/buildlinux64mingw32.sh || exit 1
	cd -
	cd $(top_builddir)/scripts
	sh $(top_builddir)/scripts/buildcrossfromnative.sh || exit 1
	cd -
	echo "Building linux 64-bit to Windows 64-bit cross-compiler"
	cd $(top_builddir)/target-scripts
	sh $(top_builddir)/target-scripts/buildlinux64mingw64.sh || exit 1
	cd -
	cd $(top_builddir)/scripts
	sh $(top_builddir)/scripts/buildcrossfromnative.sh || exit 1
	cd -

clean-local:
	@echo "Cleaning $(top_builddir)/src/@TARGET_GCC_VER@"
	rm -rf $(top_builddir)/src/@TARGET_GCC_VER@