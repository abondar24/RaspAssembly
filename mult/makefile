UPPEROBJS = mult.o print.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUUGFLGS = 
endif
LSTFFLGS =

all: mult

%.o : %.s
	as $(DEBUGFLGS) $(LSTFFLGS) $< -o $@

upperFunc: $(UPPEROBJS)
	ld -o mult $(UPPEROBJS)
