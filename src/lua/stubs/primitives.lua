print "hola"

function getDisplaySize()
    return 800,600
end

function drawPoint(c, x, y)
    print("*** drawPoint: (" .. x .. ", " .. y .. ") with color: " .. c) 
end

function drawLine(c, x1, y1, x2, y2)
    _drawLine(x1, y1, x2, y2)
end

function drawPolygon(c, listOfPoints)
    _drawPolygon(listOfPoints)
end

function flush()
    _flush()
end