require "stubs.primitives"
local complex = require "fractaljoy.complex"
--[[
title: Mandelbrot Set
author: Arturo Escudero <darkturo@gmail.com> // @aescuderoz
date: 2013-12-24
description: Formula to plot the Mandelbrot set with fractaljoy.
]]

function formulaType()
    return "complex"
end

--[[ Customizable parameters hash map. ]]
formulaParameters = {
    maxIterations = {
        value = 0,
        defaultValue = 256,
        name = "Max Number of Iterations",
        description = "Max Number of iterations to apply the formula"
    },
    Z_real = {
        value = 0,
        defaultValue = 0,
        name = "Z real part",
        description = "Initial Z (real part)"
    },
    Z_imaginary = {
        value = 0,
        defaultValue = 0,
        name = "Z imaginary part",
        description = "Initial Z (imaginary part)"
    }
}

function runFormula(params)
    --[[ Mandelbrot algorithm ]]
    params = params or formulaParameters
    region = region or {} -- FIXME: change this for default display size.

    width, height = primitives.getScreenDimension()
    for i = 0, width-1 do
        for j = 0, height-1 do
            C = map(width, height, i, j)
            Z = complex.ComplexNumber:new({r=params.Z_real, i=params.Z_imaginary})
            iteration = 0

            while iteration < params.maxIterations or not inMandelbrotSetRegion(Z) do
                Z = Z^2 + C
                iteration = iteration + 1
            end
            drawMandelbrotSetPoint(Z, iteration)
        end
    end
end
    
function map(i, j)
    -- do some magic here to map, the screen to the region. and return some complex number.
end

function inMandelbrotSetRegion(Z)
    return modulus(Z) <= 4
end

function drawMandelbrotSetPoint(Z, iteration)
    color = black
    if (not inMandelbrotSetRegion(Z)) then
        color = defaultPalette[iteration]
    end
    drawPoint(color, Z.r, Z.i)
end
