#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

cmake -B build -S ${SRC_DIR} -G Ninja
    -DCMAKE_BUILD_TYPE=Release     \
    -Wno-dev \
    ${CMAKE_ARGS}

cmake --build build -j ${CPU_COUNT}
# Test fail on CI with Child aborted***Exception, but pass locally
# make test
cmake --install build
