--[[ fractaljoy drawing primitives ]]
module("fractaljoy.primitives", package.seeall)

function drawPoint(x, y)
    _drawPoint(x, y)
end

function drawLine(x1, y1, x2, y2)
    _drawLine(x1, y1, x2, y2)
end

function drawPolygon(listOfPoints)
    _drawPolygon(listOfPoints)
end

function flush()
    _flush()
end