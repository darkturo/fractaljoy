.PHONY: tests 

all: source tests

source:
	make -C src

install:
	@echo Install not supported yet.

uninstall:
	@echo Uninstall not supported yet.

clean:
	make -C src clean
	make -C tests clean

tests: 
	make -C tests tests
