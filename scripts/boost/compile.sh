#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --time=1:00:00
#SBATCH --mem=32GB
#SBATCH --output=../../build/log/boost_%A.out
#SBATCH --error=../../build/log/boost_%A.err

# Load modules
module purge

module load gcc/6.3.0
module load cmake/intel/3.7.1
module swap python/intel python3/intel/3.6.3

export CC=${GCC_ROOT}/bin/gcc
export CXX=${GCC_ROOT}/bin/g++

# Run job
cd "${SLURM_SUBMIT_DIR}"

pushd ../../build/boost_1_67_0
./b2 -j 8 install
popd
