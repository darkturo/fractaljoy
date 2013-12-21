-- complex numbers
module("fractaljoy.complex", package.seeall)
local complex = _M

ComplexNumber = {}
ComplexNumber.prototype = { r = 0.0, i = 0.0 }
ComplexNumber.mt = {}
ComplexNumber.mt.__index = function (table, key) return ComplexNumber.prototype[key] end

function ComplexNumber:new(c)
    c = c or {}
    setmetatable(c, ComplexNumber.mt)
    return c
end

return complex 