MATLAB=octave
# MEX=mex -O -I/usr/local/include -L/usr/local/lib
MEX=mkoctfile --mex
MEXEXT=mex
PWD=$(shell pwd)

TARGETS=zmq
.PHONY: all clean $(TARGETS)
	
all: $(TARGETS)

zmq:	
	$(MEX) $@.cc -lzmq

test:
	@echo "Testing matlab scripts!"
	$(MATLAB) --eval "test_zmq"
	@echo "Done!"

clean:
	rm -f *.$(MEXEXT) *.o
