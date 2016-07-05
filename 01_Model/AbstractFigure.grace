import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/Util" as Util
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/Event" as Event
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/Figure" as Figure
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/01_DesignPattern/list" as list 
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/02_View/Graphics" as Graphics
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/Handle" as Handle

// Observation: Grace does not require Type. Can be hard to read code. 
class AbstractFigure {
    inherit Figure.Figure
    var zValue is readable,writeable := 0
    var listenerList is readable,writeable := list.with[]

    method getListenerList {
        return listenerList
    }

    // TODO Release might not be needed yet
    method release {
        print "release called"
        var figureEvent := Event.FigureEvent (self)
        var counter := self.getListenerList.size - 1
        // print "{counter}"
        for (0 .. counter) do { n:Number -> 
            self.getListenerList.get(n).figureRemoved(figureEvent)
        }
    }

    method addFigureListener(figureListener) {
        self.listenerList.add(figureListener)
    }

    method addToContainer(figure, figureListener ) {
        figure.addFigureListener(figureListener)
        figure.changed(figure)
    }

    method changed(figure ) {
        var figureEvent := Event.FigureEvent (figure)
        var counter := self.getListenerList.size - 1
        for (0 .. counter) do { n:Number -> 
            figure.getListenerList.get(n).figureChanged(figureEvent)
        }
    }
    
    //Template Pattern    
    method moveBy(figure, dx, dy) {
        figure.moveBy(dx, dy)
        figure.changed(figure)
    }

    method setDisplayBoxRect(figure, rect) {
        figure.setDisplayBox(figure, Util.Point(rect.x, rect.y), Util.Point (rect.x + rect.width, rect.y + rect.height) )
    }

    method setDisplayBox(figure, topLeft, bottomRight) {
        figure.setBasicDisplayBox(topLeft, bottomRight)
        figure.changed(figure)
    }

    method setBasicDisplayBox(topLeft, bottomRight) {
        //do nothing (How would that work anyway?)
    }

    method printAll {
    }

    // // TODO Find out what the method is for. 
    // method getSize( figure) {
    //     var dimension := Util.Dimension (figure.getDisplayBox().width,figure.getDisplayBox().height)
    //     return dimension
    // }
}

class RectangleFigure {
    inherit AbstractFigure 
    var displayBox := Util.Rectangle(0,0,0,0)
    print "Rectangle created"

    method newRectangleFigure()  {
        return newRectangleFigureFromPoints(Util.Point(0, 0), Util.Point(0, 0))
    }

    method newRectangleFigureFromPoints(pointTopLeft, pointBottomRight) {
        var figure := RectangleFigure()
        figure.setBasicDisplayBox(pointTopLeft, pointBottomRight)
        return figure
    }

    method newRectangleFigureFromRect(rectangle) {
        return self.newRectangleFigureFromPoints(
            Util.Point(rectangle.x, rectangle.y), 
            Util.Point(rectangle.x + rectangle.width, rectangle.y + rectangle.height))
    }

    method draw (graphics) {
        print "Call draw() in RectangleFigure"
        graphics.setFGColor("Gray")
        graphics.drawRectFromRect(self.getDisplayBox())
    }

    method setBasicDisplayBox(topLeft, bottomRight) {
        var box := Util.Rectangle (0,0,0,0)
        self.displayBox := box.newRectangleFromPoints(topLeft,bottomRight)
    }

    method basicMoveBy(xd, yd) {
        self.displayBox.moveBy(xd, yd)
    }

    method getDisplayBox() {
        var rect := Util.Rectangle(0,0,0,0)
        return rect.newRectangleFromRect(self.displayBox)
    }

    // TODO Implementation to get all the handles from CompositeFigure
    method getHandles()  {
        var handle := Handle.Handle
        handle.addAllHandles(self)
        return handle
    }

    method accept (visitor) {
        visitor.visitRetangleFigure (self)
    }
}


class CompositeFigure {
    inherit AbstractFigure
      alias releaseAbstractFigure = release 
    print "CompositeFigure created"
    def figureList = list.with []
    
    method add (_figure) {
        figureList.add(_figure)
        var listener := Util.FigureListener
        self.addToContainer (_figure,listener)
        print "{_figure} successfully added"
    }

    method addAll (_figureList) {
        var counter := _figureList.size
        for (0 .. counter) do { n:Number -> 
            figureList.add(_figureList.get(n))
        }
    }

    method draw (graphics) {
        var counter := figureList.size
        for (0 .. counter) do { n:Number -> 
            figureList.get(n).draw
        }
    }

    method getFigureList () {
        return self.figureList
    }

    method basicMoveBy (x,y) {
        var counter := figureList.size
        for (0 .. counter) do { n:Number -> 
            figureList.get(n).moveBy(figureList.get(n),x,y)
        }
    }

    // TODO Problem with inheritance: Method with >1 argument(s) are not able to inherit the parent method
    method release is override {
        releaseAbstractFigure 
        print "hehhehehehhe"
        var counter := self.figureList.size - 1
        for (0 .. counter) do { n:Number -> 
            print "{n}"
            self.figureList.get(n).release
        }
    }

    method getDisplayBox {
        if (self.figureList.size > 0) then {
            var displayBox := self.figureList.get(0).getDisplayBox()
            var counter := figureList.size
            for (1 .. counter) do { n:Number -> 
                displayBox := displayBox.union(figureList.get(n).getDisplayBox)
            }
            return displayBox
        }
        return Rectangle
    }
    
    // TODO not tested
    method getHandles {
        var handles := list.with []
        var counter := figureList.size
        for (1 .. counter) do { n:Number -> 
            handles.figureList.get(n).addAllHandles(self.figureList.get(n))
        }
        return handles
    }


    method figureChanged (figureEvent) {
        var counter := self.listenerList.size 
        for (0 .. counter) do { n:Number -> 
            figureList.get(n).figureChanged(FigureEvent(self))
        }
    }

    method figureAdded (figureEvent) {
        var counter := self.listenerList.size 
        var event := FigureEvent (self)
        for (0 .. counter) do { n:Number -> 
            figureList.get(n).figureAdded(event)
        }
    }

    method accept (visitor) {
        visitor.visitCompositeFigure (self)
        var counter := figureList.size - 1
        for (0 .. counter) do { n:Number ->
            figureList.get(n).accept(visitor)
        }
    }
}
    //     method figureRemoved (figureEvent) {
//         var counter := self.listeners.size 
//         for (0 .. counter) do { n:Number -> 
//             figureList.get(n).figureRemoved(FigureEvent(self))
//         }
//     }


//Base class for visitors of AbstracFigure class 
class AbstracFigureVisitor {
    method visitCompositeFigure (figure) { }
    method visitRetancleFigure (figure) { }
}

//Visitor : print all figures to the console 
class PrintAllFigures {
    inherit AbstracFigureVisitor
    method visitCompositeFigure (figure) is override {
        print "Composite {figure}"
    }
    method visitRetangleFigure (figure) is override {
        print "Rectangle {figure}" 
    }
}

    


