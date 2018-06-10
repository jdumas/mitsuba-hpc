import os, sys

BOOSTBASE = '<BOOST_DIR>'

BUILDDIR       = '#build/release'
DISTDIR        = '#dist'
CXX            = '/share/apps/gcc/6.3.0/bin/g++'
CC             = '/share/apps/gcc/6.3.0/bin/gcc'
CXXFLAGS       = ['-O3', '-Wall', '-g', '-pipe', '-march=nocona', '-msse2', '-ftree-vectorize', '-mfpmath=sse', '-funsafe-math-optimizations', '-fno-rounding-math', '-fno-signaling-nans', '-fno-math-errno', '-fomit-frame-pointer', '-DMTS_DEBUG', '-DSINGLE_PRECISION', '-DSPECTRUM_SAMPLES=3', '-DMTS_SSE', '-DMTS_HAS_COHERENT_RT', '-fopenmp', '-fvisibility=hidden', '-mtls-dialect=gnu2']
LINKFLAGS      = []
BASELIBDIR     = ['/share/apps/fftw/3.3.6-pl2/intel/lib', os.path.join(BOOSTBASE, 'lib'), '/share/apps/xerces-c/3.1.4/intel/lib', '/share/apps/openexr/2.2.0/intel/lib', '/share/apps/ilmbase/2.2.0/intel/lib', '/share/apps/glew/1.13.0/intel/lib64']
SHLINKFLAGS    = ['-rdynamic', '-shared', '-fPIC', '-lstdc++']
BASEINCLUDE    = ['#include', os.path.join(BOOSTBASE, 'include'), '/share/apps/fftw/3.3.6-pl2/intel/include', '/share/apps/ilmbase/2.2.0/intel/include', '/share/apps/glew/1.13.0/intel/include']
BASELIB        = ['dl', 'm', 'pthread', 'gomp']
EIGENINCLUDE   = ['/share/apps/eigen/3.3.1/include']
OEXRINCLUDE    = [] #'/share/apps/openexr/2.2.0/intel/include'
OEXRLIB        = ['Half', 'IlmImf', 'z']
PNGLIB         = ['png']
JPEGLIB        = ['jpeg']
XERCESINCLUDE  = ['/share/apps/xerces-c/3.1.4/intel/include']
XERCESLIB      = ['xerces-c']
GLINCLUDE      = ['/usr/include/glew-1.13.0']
GLLIB          = ['GL', 'GLU', 'GLEWmx', 'Xxf86vm', 'X11']
GLFLAGS        = ['-DGLEW_MX']
BOOSTLIB       = ['boost_system', 'boost_filesystem', 'boost_thread']
COLLADAINCLUDE = ['/usr/include/collada-dom-mitsuba', '/usr/include/collada-dom-mitsuba/1.4']
COLLADALIB     = ['collada14dom', 'xml2']
FFTWLIB        = ['fftw3_threads', 'fftw3']

# The following runs a helper script to search for installed Python
# packages that have a Boost Python library of matching version.
# A Mitsuba binding library will be compiled for each such pair.
# Alternatively, you could also specify the paths and libraries manually
# using the variables PYTHON27INCLUDE, PYTHON27LIB, PYTHON27LIBDIR etc.

# import sys, os
# sys.path.append(os.path.abspath('../data/scons'))
# from detect_python import detect_python
# locals().update(detect_python())

PYTHON36INCLUDE = ['/share/apps/python3/3.6.3/intel/include/python3.6m']
PYTHON36LIB     = ['python3', 'boost_python36']
PYTHON36LIBDIR  = ['/share/apps/python3/3.6.3/intel/lib', os.path.join(BOOSTBASE, 'lib')]
