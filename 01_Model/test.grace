import "platform/graphics" as g   // which will load in your graphics.cs module
print(g.splat(1))

def handler = object {
    method buttonClicked(x) {
        print "CLICKETY CLICK"
    }
}


g.createNewWindow( 1 )
g.createButtonCllicked { x ->  print "CLICKETY CLICK {x}"}
//g.createButtonCllicked (handler)

g.run( 1 )

print "DONE"
