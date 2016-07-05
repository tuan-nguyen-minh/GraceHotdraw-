class Figure {
    
    // Gets the display box of a figure
    // @see #basicDisplayBox
    ///
    method displayBox(){}

    // /**
    //  * Moves the Figure to a new location.
    //  * @param x the x delta
    //  * @param y the y delta
    //  */
    method moveBy(dx, dy) {}
    
    // Draws the figure.
    // @param g the Graphics to draw into
    ///
    method draw( graphics){}

    
    // Returns the handles used to manipulate
    // the figure. Handles is a Factory Method for
    // creating handle objects.
    //
    // @return a Vector of handles
    // @see Handle
    ///
    method handles(){}

    
    // Gets the size of the figure
    ///
    method getSize(){}

    
    // Gets the figure's center
    ///
    method center(){}

    
    // Returns an Enumeration of the figures contained in this figure
    ///
    method figures(){}

    
    // Returns the figure that contains the given point.
    ///
    method findFigureInside(x, y){}

    
    // Checks if a point is inside the figure.
    ///
    method containsPoint( x, y){}

    
    // Returns a Clone of this figure
    ///
    method clone(){}

    
    // Changes the display box of a figure. This is a
    // convenience method. Implementors should only
    // have to override basicDisplayBox
    // @see #displayBox
    ///
    method displayBox(rectangle ){}

    
    // Checks whether the given figure is contained in this figure.
    ///
    method includes(figure){}

    
    // Decomposes a figure into its parts. A figure is considered
    // as a part of itself.
    ///
    method decompose(){}

    
    // Sets the Figure's container and registers the container
    // as a figure change listener. A figure's container can be
    // any kind of FigureChangeListener. A figure is not restricted
    // to have a single container.
    ///
    method addToContainer (figureChangeListener){}

    
    // Removes a figure from the given container and unregisters
    // it as a change listener.
    ///
    method removeFromContainer( figureChangeListener ){}

    
    // Gets the Figure's listeners.
    ///
    method getListeners(){}

    
    // Adds a listener for this figure.
    ///
    method addFigureChangeListener (figureChangeListener){}

    
    // Removes a listener for this figure.
    ///
    method removeFigureChangeListener (figureChangeListener){}

    
    // Releases a figure's resources. Release is called when
    // a figure is removed from a drawing. Informs the listeners that
    // the figure is removed by calling figureRemoved.
    ///
    method release(){}

    
    // Invalidates the figure. This method informs its listeners
    // that its current display box is invalid and should be
    // refreshed.
    ///
    method invalidate(){}

    
    // Informes that a figure has changed its display box.
    // This method also triggers an update call for its
    // registered observers.
    // @see #invalidate
    // @see #willChange
    //
    ///
    method changed(){}

    
    // Checks if this figure can be connected
    ///
    method canConnect(){}

    
    // Returns the named attribute or null if a
    // a figure doesn't have an attribute.
    // All figures support the attribute names
    // FillColor and FrameColor
    ///
    method getAttribute(name){}

    
    // Sets the named attribute to the new value
    ///
    method setAttribute(name, value){}

    
    // Gets the z value (back-to-front ordering) of this figure.
    // Z values are not guaranteed to not skip numbers.
    ///
    method getZValue(){}

    
    // Sets the z value (back-to-front ordering) of this figure.
    // Z values are not guaranteed to not skip numbers.
    ///
    method setZValue(z){}

    method setDisplayBox () {}
}
