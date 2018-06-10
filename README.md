# Mitsuba + PyRenderer with Python 3 on the HPC

Getting Mistuba to run the NYU HPC is not an easy task.
Hopefully this set of scripts will make it easier to get it running,
so that you can use it with PyMesh and PyRenderer on Python 3.

##### Note

It is recommended that you compile Boost + Mitsuba either directly `/scratch` or `/beegfs`, or modify the current script to use those partitions for the `build/` folder (e.g. make it a symlink, etc.).

## Modules

A `.bashrc` with all the modules described in this README is provided in the `scripts/` folder. Please make sure you incorporate it in your `~/.bashrc` or `~/.bash_profile` as appropriate.

## Boost + Mitsuba

The first step is to compile Boost. Simply run `make boost` in the folder containing this README to download and compile Boost 1.67.0 with support for Python 3 enabled. Wait until the compilation job is done. You can check job status with the command:

```
squeue -u $USER
```

Once this is done, the second step is to compile Mistuba. Again, simply typing `make mitsuba` should do the job here.

There is nothing fancy going on here. The make targets are just phony targets that are always executed, and those targets actually submit jobs via slurm to compile the actual libraries (so we can go a bit faster yay).

##### Known Issues

I haven't figured out how to compile Mitsuba with OpenEXR support on the HPC. Compilation with the available modules doesn't seem to work somehow.

## PyMesh

Download the repository:

```bash
git clone git@github.com:qnzhou/PyMesh.git
```

Make sure the following variables are properly exported in your `~/.bashrc` or `~/.bash_profile`:

```bash
module load gmp/gnu/6.1.2
module load mpfr/gnu/3.1.5
export GMP_DIR=${GMP_ROOT}
export MPFR_DIR=${MPFR_ROOT}
```

Clean previous builds, compile and install PyMesh in userspace:

```bash
git clean -fdx .
./setup.py build
./setup.py install --user
```

## PyRenderer

```bash
git clone git@github.com:qnzhou/PyRenderer.git
```

I typically create a symlink to the main executable in my `~/.local/bin` folder so that I can call it from everywhere.

In your `~/.bashrc` or `~/.bash_profile` put the following:

```bash
export PATH=$PATH:$HOME/.local/bin
```

Then create the symlink:

```bash
ln -s <path_to_pyrenderer>/render.py ~/.local/bin/pyrenderer
```
