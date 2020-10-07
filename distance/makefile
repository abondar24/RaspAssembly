ifdef DEBUG
DEBUGFLGS = -g
else
DEBUUGFLGS = 
endif
LSTFFLGS =

all: dist

%.o : %.s
	as $(DEBUGFLGS) $(LSTFFLGS) $< -o $@

dist: dist.s main.s
	gcc -mfpu=vfp -g -o dist dist.s main.s
