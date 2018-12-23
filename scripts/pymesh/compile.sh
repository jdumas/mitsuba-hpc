#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=32GB
#SBATCH --output=../../build/log/pymesh_%A.out
#SBATCH --error=../../build/log/pymesh_%A.err

module purge

module load gcc/6.3.0
module load cmake/intel/3.11.4

export CC=${GCC_ROOT}/bin/gcc
export CXX=${GCC_ROOT}/bin/g++

# PyMesh
module load boost/intel/1.62.0
module swap python/intel python3/intel/3.6.3
module load gmp/gnu/6.1.2
module load mpfr/gnu/3.1.5
export GMP_DIR=${GMP_ROOT}
export MPFR_DIR=${MPFR_ROOT}

# Run job
cd "${SLURM_SUBMIT_DIR}"

if [ ! -d PyMesh ]; then
	git clone --recursive git@github.com:qnzhou/PyMesh.git
fi

pushd PyMesh
git clean -fdx .
./setup.py build
./setup.py install --user
popd
