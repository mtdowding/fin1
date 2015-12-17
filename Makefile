# Makefile for pi calculation via polygon perimeter and the corresponding docs

GNUPLOT = gnuplot

CC        = clang
LDFLAGS   = -O3
ifeq ($(CC),clang)
  CFLAGS  = -Weverything -Wextra -pedantic $(LDFLAGS)
else
  CFLAGS  = -Wall -Wextra -pedantic $(LDFLAGS)
endif
LDLIBS    = -lm

.SUFFIXES:
.SUFFIXES:  .c .o .gp

.PHONY: clean veryclean

%.res: %.c
	$(CC) $(CFLAGS) $< -o $* $(LDLIBS)
	./$* > $*.res
	rm -f ./$*

png: pi-poly-u.res
	$(GNUPLOT) pi-poly-u.gp
	eog pi-poly-u.png

clean: 
	rm -f *.*~
	rm -f *.o


