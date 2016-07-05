import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/AbstractFigure" as AbstractFigure

class AbstractFigureDecorator (_figure) {
    inherit AbstractFigure.AbstractFigure
    var figure := _figure


    //forward call to contained figure
    method draw (graphics) {
        print "Call draw() in AbstractFigureDecorator"
        self.figure.draw(graphics)
    }

    //forward call to contained figure
    method getDisplayBox {
        return self.figure.getDisplayBox
    }

    //forward call to contained figure
    method getHandles() {
        return self.figure.getHandles
    }

    //forward call to contained figure
    method release {
        self.figure.release
    }

    //forward call to contained figure
    method basicMoveBy(dx, dy) {
        self.figure.basicMoveBy(dx,dy)
    }

    //forward call to contained figure
    method setBasicDisplayBox(topLeft, bottomRight) {
        self.figure.setBasicDisplayBox(topLeft,bottomRight)
    }
}

class BorderDecorator (_figure) {
    inherit AbstractFigureDecorator (_figure)
      alias drawSuper (graphics) = draw (graphics)

    method draw (graphics) is override {
        drawSuper(graphics)
        print "Call draw() in BorderDecorator"
        graphics.setFGColor("Black")
        graphics.drawBorderFromRect(self.getDisplayBox)
    }

    method clone {
        return BorderDecorator(self.figure)
    }
}
    
