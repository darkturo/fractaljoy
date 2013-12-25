#ifndef __LUA_Primitives_h__
#define __LUA_Primitives_h__

int drawPoint(lua_State *L);
int drawLine(lua_State *L);
int drawPolygon(lua_State *L);
int flush(lua_State *L);

void lua_open_primitiveLib (lua_State *L);

struct myluaL_Reg {
    char * name;
    lua_CFunction function;
};
#endif