--[[ Complex Numbers ]]
module("fractaljoy.complex", package.seeall)

ComplexNumber = {}
ComplexNumber.prototype = { r = 0.0, i = 0.0 }
ComplexNumber.mt = {}
ComplexNumber.mt.__index = function (table, key) return ComplexNumber.prototype[key] end

-- Constructor
function ComplexNumber:new(c)
    c = c or {}
    setmetatable(c, ComplexNumber.mt)
    return c
end

--[[ Operators ]]
-- Equal
ComplexNumber.mt.__eq = function (lhs, rhs) 
    return ((lhs.r == rhs.r) and (lhs.i == rhs.i)) 
end

-- Add
ComplexNumber.mt.__add = function (lhs, rhs) 
    return ComplexNumber:new( { r = lhs.r + rhs.r, i = lhs.i + rhs.i } )
end

