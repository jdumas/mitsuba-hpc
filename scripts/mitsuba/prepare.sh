#! /bin/bash
#
# Must be run with cwd set to the folder containing this file
#

SCRIPT_DIR=`pwd`
INSTALL=../..
BOOST_DIR=`realpath $INSTALL/boost`

# Install scons from pip
pip install --user -U --egg scons

pushd $INSTALL

# Download sources
function download() {
	rm -rf mitsuba
	git clone git@github.com:mitsuba-renderer/mitsuba.git
}

download

# Prepare build
function prepare() {
	cd mitsuba
	cp ${SCRIPT_DIR}/config.py config.py
	sed -i "s|<BOOST_DIR>|$BOOST_DIR|" config.py
	2to3 -w ./build/SConscript.install
	2to3 -w ./build/SConscript.configure
}

prepare

popd
