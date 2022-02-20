#!/bin/bash

# Working directory: llvm-project

if [ ! -d build-debug ]; then
    mkdir build-debug
    cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;lld;libcxx;libcxxabi;compiler-rt" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_USE_LINKER=lld ../llvm 2>&1 | tee build.log
fi
cd build-debug


make -j$(nproc) 2>&1 | tee -a build.log

