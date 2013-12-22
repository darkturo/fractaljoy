FRACTALJOY_LIB=fractaljoyLib.lout
FRACTALJOY_FILES=$(shell find lua -name "*.lua") 

all: 
	luac -o ${FRACTALJOY_LIB} ${FRACTALJOY_FILES}

clean:
	rm -f *.o 
	rm -f ${FRACTALJOY_LIB}
