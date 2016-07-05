import "/Users/if0814/Dropbox/01_Master_Studium/04_Semester_NZ/03_Thesis/02_Implementation/02_GHotdraw/01_Model/Handle" as HandlePackage

method AddCornerHandles(f Figure, handles *Set) {
	handles.Push(newSouthEastHandle(f))
	handles.Push(newSouthWestHandle(f))
	handles.Push(newNorthEastHandle(f))
	handles.Push(newNorthWestHandle(f))
}

method AddAllHandles(f Figure, handles *Set) {
	AddCornerHandles(f, handles)
	handles.Push(newSouthHandle(f))
	handles.Push(newEastHandle(f))
	handles.Push(newNorthHandle(f))
	handles.Push(newWestHandle(f))
}

class resizeHandle (ownerFigure, locator) {
	inherit HandlePackage.LocatorHandle (ownerFigure, locator)

	method invokeStart(x, y, drawingView) {
		//TODO
	}

	method invokeEnd(x, y, drawingView) {
		//TODO
	}
}

class northEastHandle struct {
		*resizeHandle
	}

	method newNorthEastHandle(owner Figure) *northEastHandle {
		return &northEastHandle{newResizeHandle(owner, CreateNorthEastLocator())}
	}

	method (this *northEastHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
		r := this.owner.GetDisplayBox()
		this.owner.SetDisplayBox(
			this.owner, 
			&Point{r.X, int(math.Fmin(float64(r.Y+r.Height), float64(y)))}, 
			&Point{int(math.Fmax(float64(r.X), float64(x))), r.Y + r.Height})
	}
}

class eastHandle struct {
	*resizeHandle
}

method newEastHandle(owner Figure) *eastHandle {
	return &eastHandle{newResizeHandle(owner, CreateEastLocator())}
}

method (this *eastHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	this.owner.SetDisplayBox(
		this.owner, 
		&Point{r.X, r.Y}, 
		&Point{int(math.Fmax(float64(r.X), float64(x))), r.Y + r.Height})
}

class northHandle struct {
	*resizeHandle
}

method newNorthHandle(owner Figure) *northHandle {
	return &northHandle{newResizeHandle(owner, CreateNorthLocator())}
}

method (this *northHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	topLeft := &Point{r.X, int(math.Fmin(float64(r.Y+r.Height), float64(y)))}
	bottomRight := &Point{r.X + r.Width, r.Y + r.Height}
	this.owner.SetDisplayBox(this.owner, topLeft, bottomRight)
}

class northWestHandle struct {
	*resizeHandle
}

method newNorthWestHandle(owner Figure) *northWestHandle {
	return &northWestHandle{newResizeHandle(owner, CreateNorthWestLocator())}
}

method (this *northWestHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	topLeft := &Point{int(math.Fmin(float64(r.X+r.Width), float64(x))), int(math.Fmin(float64(r.Y+r.Height), float64(y)))}
	bottomRight := &Point{r.X + r.Width, r.Y + r.Height}
	this.owner.SetDisplayBox(this.owner, topLeft, bottomRight)
}

class southEastHandle struct {
	*resizeHandle
}

method newSouthEastHandle(owner Figure) *southEastHandle {
	return &southEastHandle{newResizeHandle(owner, CreateSouthEastLocator())}
}

method (this *southEastHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	this.owner.SetDisplayBox(this.owner, &Point{r.X, r.Y}, 
		&Point{int(math.Fmax(float64(r.X), float64(x))), int(math.Fmax(float64(r.Y), float64(y)))})
}

class southHandle struct {
	*resizeHandle
}

method newSouthHandle(owner Figure) *southHandle {
	return &southHandle{newResizeHandle(owner, CreateSouthLocator())}
}

method (this *southHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	this.owner.SetDisplayBox(this.owner, &Point{r.X, r.Y}, 
		&Point{r.X + r.Width, int(math.Fmax(float64(r.Y), float64(y)))})
}

class southWestHandle struct {
	*resizeHandle
}

method newSouthWestHandle(owner Figure) *southWestHandle {
	return &southWestHandle{newResizeHandle(owner, CreateSouthWestLocator())}
}

method (this *southWestHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	topLeft := &Point{int(math.Fmin(float64(r.X+r.Width), float64(x))), r.Y}
	bottomRight := &Point{r.X + r.Width, int(math.Fmax(float64(r.Y), float64(y)))}
	this.owner.SetDisplayBox(this.owner, topLeft, bottomRight)
}

class westHandle struct {
	*resizeHandle
}

method newWestHandle(owner Figure) *westHandle {
	return &westHandle{newResizeHandle(owner, CreateWestLocator())}
}

method (this *westHandle) InvokeStep(x, y, anchorX, anchorY int, view DrawingView) {
	r := this.owner.GetDisplayBox()
	this.owner.SetDisplayBox(this.owner, 
		&Point{int(math.Fmin(float64(r.X+r.Width), float64(x))), r.Y}, 
		&Point{r.X + r.Width, r.Y + r.Height})
}
