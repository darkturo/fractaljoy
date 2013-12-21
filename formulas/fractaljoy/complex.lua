-- complex numbers
module("fractaljoy.complex", package.seeall)
local complex = _M

ComplexNumber = {}
ComplexNumber.prototype = { r = 0.0, i = 0.0 }
ComplexNumber.mt = {
    __eq  = function (lhs, rhs) 
                return ((lhs.r == rhs.r) and (lhs.i == rhs.i)) 
            end
    ,
    __add = function (lhs, rhs) 
                return { r = lhs.r + rhs.r, 
                         i = lhs.i + rhs.i } 
            end
}
ComplexNumber.mt.__index = function (table, key) return ComplexNumber.prototype[key] end

function ComplexNumber:new(c)
    c = c or {}
    setmetatable(c, ComplexNumber.mt)
    return c
end