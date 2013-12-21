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

--[[ Equivalence Operators ]]
-- Equality
ComplexNumber.mt.__eq = function (lhs, rhs) 
    return ((lhs.r == rhs.r) and (lhs.i == rhs.i)) 
end

-- Inequality
ComplexNumber.mt.__neq = function (lhs, rhs) 
    return ((lhs.r ~= rhs.r) or (lhs.i ~= rhs.i)) 
end

--[[ Mathematic Operators]]
-- Addition
ComplexNumber.mt.__add = function (lhs, rhs) 
    return ComplexNumber:new( { r = lhs.r + rhs.r, i = lhs.i + rhs.i } )
end

-- Substraction
ComplexNumber.mt.__sub = function (lhs, rhs)
    return ComplexNumber:new( { r = lhs.r - rhs.r, i = lhs.i - rhs.i } )    
end

-- Minus Sign (unary)
ComplexNumber.mt.__unm = function (c)
    return ComplexNumber:new( { r = -c.r , i = -c.i })
end

-- Multiplication
ComplexNumber.mt.__mul = function (lhs, rhs)
    return ComplexNumber:new( { r = (lhs.r * rhs.r) - (lhs.i * rhs.i),
                                i = (lhs.i * rhs.r) + (lhs.r * rhs.i) } )
end

-- Division
ComplexNumber.mt.__div = function (lhs, rhs)
    divisor = rhs.r^2 + rhs.i^2
    return ComplexNumber:new({ r = ((lhs.r * rhs.r) + (lhs.i * rhs.i))/divisor, 
                               i = ((lhs.i * rhs.r) - (lhs.r * rhs.i))/divisor } )
end

-- Exponent
ComplexNumber.mt.__pow = function (c, exp)
    result = c
    for i=2,exp do 
        result = result * c
    end
    return result
end