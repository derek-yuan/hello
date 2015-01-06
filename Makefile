CC = gcc
#CFLAGS = -Wall -I ../include 
CFLAGS = -Wall
#LFLAGS = -L ../bin -lhev-lib
#LFLAGS = --static 
LFLAGS =

tar = hello 

source = $(wildcard *.c)
obj := $(patsubst %.c,%.o,$(source))

.PHONY : all
all : $(tar)

$(tar) : $(obj)
	$(CC) $(CFLAGS) -o $(tar) $(obj) $(LFLAGS)

copy :
	@-cp -v $(tar) ~/scp/

.PHONY : cscope
cscope :
	@echo create cscope database
	@-find . -name '*.[chS]' > cscope.files
	@-cscope -b -R -q

.PHONY : csclean
csclean :
	@-rm -vf cscope.*

.PHONY : clean
clean :
	-rm $(tar) $(obj)
