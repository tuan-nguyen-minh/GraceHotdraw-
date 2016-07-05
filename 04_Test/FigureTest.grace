import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/AbstractFigure" as AbstractFigure
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/Util" as  Util
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/FigureDecorator" as FigureDecorator
import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/02_View/Graphics" as Graphics

// Test Composite and Visitor Pattern.
// _____________________________________
var comF1 := AbstractFigure.CompositeFigure
var comF2 := AbstractFigure.CompositeFigure
var rect1 := AbstractFigure.RectangleFigure
var rect2 := AbstractFigure.RectangleFigure
var rect3 := AbstractFigure.RectangleFigure
var rect4 := AbstractFigure.RectangleFigure

comF1.add(rect1)
comF1.add(rect2)
comF2.add(rect3)
comF2.add(rect4)
comF1.add(comF2)
//comF1.accept(AbstractFigure.PrintAllFigures)

// _____________________________________
// Test Template Pattern
// var rect := Util.Rectangle(5,5,10,10)
// rect1.setDisplayBoxRect (rect1,rect)
// comF2.release

// _____________________________________

//Test Decorator Pattern
var test := FigureDecorator.BorderDecorator (rect1)
var graphics := Graphics.Graphics 
test.draw(graphics)
