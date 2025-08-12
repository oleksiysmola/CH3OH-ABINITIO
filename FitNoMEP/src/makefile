goal:   fitpes

tarball:
	tar cfz fitpes$(PLAT).tar.gz makefile *.f90
        
checkin:
	ci -l Makefile *.f90


CODE = CH3OH_v10_theta12_14_23-KinSwap-12-08

EXE = j-$(CODE).x

FOR  = ifort   # Fortran compiler 

FFLAGS = -O3 -ip -qopenmp -mkl=parallel


LAPACK = -mkl=parallel -static

LIB     =   $(LAPACK)

###############################################################################

OBJ = $(CODE).o 

F90 =  $(CODE).f90


# clear internal suffix rules
.SUFFIXES:
# specify our own suffix rules
.SUFFIXES: .f90 .o
.f90.o:
	$(FOR) -c -o $@ $< $(FFLAGS)

fitpes: $(F90)	
	$(FOR)  $(FFLAGS)  $(LIB) $(F90) -o $(EXE)

