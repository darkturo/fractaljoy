print "hola"

function getDisplaySize()
    return 320,240 -- for testing purposes
end

function drawPoint(c, x, y)
    print("*** drawPoint: (" .. x .. ", " .. y .. ") with color: " .. c) 
end

function drawLine(c, x1, y1, x2, y2)
    print("*** drawLine: (" .. x1 .. ", " .. y1 .. ") to (" .. x2 .. "," .. y2 .. ") with color: " .. c) 
end

function drawPolygon(c, listOfPoints)
    print("*** drawPolygon: ... with color: " .. c)
end

function flush()
    print ("flush graphic!")
end