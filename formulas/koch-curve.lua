require "fractaljoy"
--[[
title: Descriptive title for this formula
author: darkturo
date: 2013-12-24
description: Formula description
]]
function formulaType()
    return "base-motif"
end

--[[ Customizable parameters hash map. ]]
formulaParameters = {
    maxIterations = {
        value = 0,
        defaultValue = 10,
        name = "Max Number of Iterations",
        description = "Max Number of iterations to apply the formula"
    },
}

function runFormula(params)
    --[[ Lua algorithm to generate the fractal. It will receive params with the
         options set by the user using the fractaljoy interface. 
         This function will use the primitives drawPoint(), drawLine or drawPoligon() and flush
         provided by fractaljoy.primitives
    ]]
    params = params or formulaParameters
    listOfPoints = getListOfPoints(params)
    drawCurve(listOfPoints, white)

    for i=1,params.maxIterations do
        listOfPoints = applyMotif(listOfPoints)
        drawCurve(listOfPoints, white)
    end
end
    
