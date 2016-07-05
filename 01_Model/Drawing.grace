import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/Figure" as Figure
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/AbstractFigure" as AbstractFigure
class Drawing {
    inherit Figure.Figure 
    method add(figure ) {}
    method remove(figure )  {}
    method findFigure(point) {}
    method getTitle() {}
    method setTitle(title) {}
}

class StandardDrawing (_titel){
    inherit Drawing
    inherit AbstractFigure.CompositeFigure
    var title := _titel

    method setTitle(_title) {
        self.title := _title
    }

    method getTitle {
        return self.titel
    }

    // TODO Find Figure by point 
    method findFigure (point) {
        print "call findFigure()"
        return Done
    }
}

var test := StandardDrawing("hello")