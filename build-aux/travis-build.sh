#!/bin/bash

set -ex

rm -rf build
mkdir -p build

build-aux/git-version-gen .tarball-version

pushd build > /dev/null

../configure \
    CFLAGS="-Wall -g" \
    --enable-ronn \
    --disable-silent-rules \
    --enable-tests \
    --enable-valgrind \
    --enable-git-receiver \
    --enable-runserver

popd > /dev/null

make -C build "${TARGET}"
