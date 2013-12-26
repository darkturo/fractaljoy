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
        value = 256,
        name = "Max Number of Iterations",
        description = "Max Number of iterations to apply the formula"
    },
    Z_real = {
        value = 0,
        name = "Z real part",
        description = "Initial Z (real part)"
    },
    Z_imaginary = {
        value = 0,
        name = "Z imaginary part",
        description = "Initial Z (imaginary part)"
    },
    Region_top_x = {
        value = -2.5,
        name = "Region.Top.X",
        description = "X top value to define the region where the Mandelbrot set exists"
    },
    Region_top_y = {
        value = 1.5,
        name = "Region.Top.Y",
        description = "Y top value to define the region where the Mandelbrot set exists"
    },
    Region_bottom_x = {
        value = 1.5,
        name = "Region.Bottom.X",
        description = "X bottom value to define the region where the Mandelbrot set exists"
    },
    Region_bottom_y = {
        value = -1.5,
        name = "Region.Bottom.Y",
        description = "Y bottom value to define the region where the Mandelbrot set exists"
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

function mapDisplayPoint2Plane(i, j, region)
    -- Do some magic here to map the screen to the plane (within a certain region)
    -- Return a pair representing the plane. In this case, a complex number, since we're playing in the Argand Plane.
    width, height = getDisplaySize()
    real = (i * ((region.bottom.x - region.top.x)/width)) + region.top.x
    imaginary = (j * ((region.top.y - region.bottom.y)/height)) + region.top.y
    return complex.ComplexNumber:new({r = real, i = imaginary})
end

function mapPlainPoint2Display(C, region)
    -- Map a point in the plain (region x) to a Do some magic here to map, the screen to the region. and return some complex number.
    width, height = getDisplaySize()
    x = (math.abs(C.r) * (width/math.abs(region.bottom.x - region.top.x)))
    y = (math.abs(C.i) * (height/math.abs(region.top.y - region.bottom.y)))
    return x, y
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
