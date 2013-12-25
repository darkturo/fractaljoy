FRACTALJOY_LIB=fractaljoyLib.lout
FRACTALJOY_FILES=$(shell find lua -name "*.lua") 

all: 
	luac -o ${FRACTALJOY_LIB} ${FRACTALJOY_FILES}
	gcc -c lua_primitives.c

clean:
	rm -f *.o 
	rm -f ${FRACTALJOY_LIB}
