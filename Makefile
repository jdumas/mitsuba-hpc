.PHONY: all clean boost mitsuba pymesh

# Building directory
BUILD=build

all:

boost:
	cd scripts/boost && bash prepare.sh
	cd scripts/boost && sbatch compile.sh

mitsuba:
	cd scripts/mitsuba && bash prepare.sh
	cd scripts/mitsuba && sbatch compile.sh

pymesh:
	cd scripts/pymesh && sbatch compile.sh

clean:
	@rm -rf $(BUILD)
