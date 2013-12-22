LUA_TESTS=$(wildcard *.lua)

all: 

clean:
	# nothing to clean

tests:
	@lunit -p ";;../src/lua/?.lua" ${LUA_TESTS}
