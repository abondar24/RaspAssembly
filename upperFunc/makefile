UPPEROBJS = upperFunc.o fn.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUUGFLGS = 
endif
LSTFFLGS =

all: upperFunc

%.o : %.s
	as $(DEBUGFLGS) $(LSTFFLGS) $< -o $@

upperFunc: $(UPPEROBJS)
	ld -o upperFunc $(UPPEROBJS)
