export PATH=$PATH:$HOME/.local/bin

# Load modules
module purge
module load gcc/6.3.0
module load cmake/intel/3.7.1

export CC=${GCC_ROOT}/bin/gcc
export CXX=${GCC_ROOT}/bin/g++

# PyMesh
module load gmp/gnu/6.1.2
module load mpfr/gnu/3.1.5
export GMP_DIR=$GMP_ROOT
export MPFR_DIR=$MPFR_ROOT

# Mitsuba
module load xerces-c/intel/3.1.4
module load openexr/intel/2.2.0
module load fftw/intel/3.3.6-pl2
module load ilmbase/intel/2.2.0
module load glew/intel/1.13.0

# Set base path here
export BASE_DIR=<path-to-the-makefile-dir>

export MITSUBA_DIR=$BASE_DIR/mitsuba
export BOOST_LIB=$BASE_DIR/boost/lib

export PYTHONPATH="$MITSUBA_DIR/dist/python:$MITSUBA_DIR/dist/python/3.6:$PYTHONPATH"
export PYTHONPATH="$BOOST_LIB:$PYTHONPATH"
export LD_LIBRARY_PATH="$MITSUBA_DIR/dist:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$BOOST_LIB:$LD_LIBRARY_PATH"
export PATH="$MITSUBA_DIR/dist:$PATH"
