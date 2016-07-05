class Dimension (mWidth, mHeight) {
    var width is readable := mwidth 
    var int is readable := mHeight
}

class Point (mX, mY) {
    var x is readable := mX
    var y is readable := mY
}

class Rectangle (mX, mY, mWidth, mHeight) {
    var x is readable := mX
    var y is readable := mY
    var width is readable := mWidth
    var height is readable := mHeight

    //a lot of methods 
    method newRectangleFromRect(rectangle) {
        return Rectangle(rectangle.x, rectangle.y, rectangle.width, rectangle.height)
    }

    method newRectangleFromPoints (topLeft,bottomRight) {
        return Rectangle(topLeft.x, topLeft.y, bottomRight.x - x,bottomRight.y - y)
    }

    method moveBy (xd, yd) {
        print "Move Rectangle by {xd} and {yd}"
        print "WARNING: This method is not implemented yet. So it does nothing"
    }

}

class FigureListener {
    method figureChanged(figureEvent) {
        print "figure is changed"
    }
    //Sent when a figure was added to a drawing
    method figureAdded(figureEvent) {}
    method figureRemoved(figureEvent) {
        print "call figureRemoved () in FigureListener"
    }
}
