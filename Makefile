# Astrolog (Version 7.70) File: Makefile (Unix version)
#
# IMPORTANT NOTICE: Astrolog and all chart display routines and anything
# not enumerated elsewhere in this program are Copyright (C) 1991-2024 by
# Walter D. Pullen (Astara@msn.com, http://www.astrolog.org/astrolog.htm).
# Permission is granted to freely use, modify, and distribute these
# routines provided these credits and notices remain unmodified with any
# altered or distributed versions of the program.
#
# First created 11/21/1991.
#
# This Makefile is included only for convenience. One could easily compile
# Astrolog on most Unix systems by hand with the command:
# % cc -c -O *.cpp; cc -o astrolog *.o -lm -lX11
# Generally, all that needs to be done to compile once astrolog.h has been
# edited, is compile each source file, and link them together with the math
# library, and if applicable, the main X library.
#
NAME = astrolog
OBJS = astrolog.o atlas.o calc.o charts0.o charts1.o charts2.o charts3.o\
 data.o express.o general.o intrpret.o io.o matrix.o placalc.o placalc2.o\
 xdata.o xgeneral.o xdevice.o xcharts0.o xcharts1.o xcharts2.o xscreen.o\
 swecl.o swedate.o swehouse.o swejpl.o swemmoon.o swemplan.o sweph.o\
 swephlib.o

# If you don't have X windows or are not using XCAIRO comment out the following
# XCAIRO_DEBUG outputs (once) found fonts and ignores unavailable fonts.
# For XCAIRO_DEBUG add "-lfontconfig" to the following.
XCAIRO = -lcairo

# If you don't have X windows, delete the "-lX11" part from the line below:
# If not compiling with GNUC, delete the "-ldl" part from the line below:
LIBS = -lm -lX11 -ldl $(XCAIRO)

OPT = -O -s
#OPT = -g -O0
WARN = -Wno-write-strings -Wno-narrowing -Wno-comment

CPPFLAGS = $(OPT) $(WARN)
RM = rm -f

$(NAME): $(OBJS)
	cc -o $(NAME) $(OBJS) $(LIBS) $(OPT)

clean:
	$(RM) $(OBJS) $(NAME)
#
