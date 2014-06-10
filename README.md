MinGW-w64-build-scripts
=======================

Build scripts I use for building GCC toolchains

Usage
=====

First, checkout this build scripts.  
```$ git clone https://github.com/Hiroyuki-Nagata/MinGW-w64-build-scripts.git  ```  
```$ cd MinGW-w64-build-scripts.git```

execute buildall.sh, then all sources need to build will be updated.   
```$ ./scripts/updatesources.sh ```

build scripts get gcc source from version controll system and tag automatically.   
We very likely need to checkout release version of gcc.  
```$ cd src/gcc/  ```  
```$ git checkout gcc-4_8_2-release  ```  


execute !  
```$ ./buildall.sh```  

If you executed it in x86_64 Linux, script generate below binary and sources.  
```
linux64mingw32
```  
```
linux64mingw64  
```
