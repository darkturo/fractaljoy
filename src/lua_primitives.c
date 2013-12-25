#include <lua.h>
#include "lua_primitives.h"

static const struct myluaL_Reg primitivesLib [] = {
   {"drawPoint", drawPoint},
   {"drawLine", drawLine},
   {"drawPolygon", drawPolygon},
   {"flush", flush},
   {NULL, NULL} 
};

void lua_open_primitiveLib (lua_State *L) 
{
    for (int i = 0; i < sizeof(primitivesLib); i++) 
    {
        lua_register(L, primitivesLib[i].name, primitivesLib[i].function);
    }
}

int drawPoint(lua_State *L)
{
//    _drawPoint(color, x, y)
    /* TODO */
    return 0;
}

int drawLine(lua_State *L)
{
// function drawLine(color, x1, y1, x2, y2)
    /* TODO */
    return 0;    
}

int drawPolygon(lua_State *L)
{
// function drawPolygon(color, listOfPoints)
    /* TODO */
    return 0;    
}

int flush(lua_State *L) 
{
    // redraw the screen
    return 0;
}