#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=32GB
#SBATCH --output=../../build/log/mitsuba_%A.out
#SBATCH --error=../../build/log/mitsuba_%A.err

# Load modules
module purge

module load gcc/6.3.0
module load cmake/intel/3.7.1
module swap python/intel python3/intel/3.6.3

export CC=${GCC_ROOT}/bin/gcc
export CXX=${GCC_ROOT}/bin/g++

# Mitsuba
module load xerces-c/intel/3.1.4
module load openexr/intel/2.2.0
module load fftw/intel/3.3.6-pl2
module load ilmbase/intel/2.2.0
module load glew/intel/1.13.0

# Run job
cd "${SLURM_SUBMIT_DIR}"

pushd ../../mitsuba
cd mitsuba
scons --jobs=8
popd
