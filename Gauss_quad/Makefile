# Makefile for the trapRule

run_it: trap.x
	./trap.x

# Compile, run, process, and open
graph_it: trap.x
	./trap.x > out.txt
	nohup matlab -nosplash -nodisplay < plot_err.m > output.txt
	open -a preview error.eps

trap.x: trapRule.o
	gfortran trapRule.o -o trap.x

trapRule.o: trapRule.f90
	gfortran -c trapRule.f90