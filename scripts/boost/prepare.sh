#! /bin/bash
#
# Must be run with cwd set to the folder containing this file
#

SCRIPT_DIR=`pwd`
BUILD=../../build
INSTALL=../..

mkdir -p $BUILD
mkdir -p $BUILD/log
pushd $BUILD
wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz -O boost_1_67_0.tar.gz -c
tar -xf boost_1_67_0.tar.gz
pushd boost_1_67_0
./bootstrap.sh --with-python=/share/apps/python3/3.6.3/intel/bin/python3 --with-python-version=3.6 --with-python-root=/share/apps/python3/3.6.3/intel --prefix=$INSTALL/boost
cp $SCRIPT_DIR/project-config.jam .
popd
popd
