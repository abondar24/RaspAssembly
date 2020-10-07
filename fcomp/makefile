ifdef DEBUG
DEBUGFLGS = -g
else
DEBUUGFLGS = 
endif
LSTFFLGS =

all: fc

%.o : %.s
	as $(DEBUGFLGS) $(LSTFFLGS) $< -o $@

fc: fcomp.s main.s
	gcc -mfpu=vfp -g -o fc fcomp.s main.s
