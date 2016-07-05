class Graphics  {
    method addInputListener(inputListener) {}
    method removeInputListener(inputListener) {}

    method setFGColor(color){
        print "Set color = {color}"
    }
    method showWindow(){}
    method setWindowBackground( Color){}
    method setWindowTitle(title ){}
    method startListening(){}
    method getWindowSize() {}

    method drawRect(x, y, width, height){}
    method drawRectFromRect(rectangle){
        print "Draw Rectangle: {rectangle}" 
    }
    method drawBorder(x, y, width, height){}
    method drawBorderFromRect(rectangle){}
    method drawBorderedRect(x, y, width, height){}
    method drawBorderedRectFromRect(rectangle){}
    method drawBorderFromRectDirectly(rectangle){}
    
    method repaint(srcX, srcY, destX, destY , width , height){}
}
