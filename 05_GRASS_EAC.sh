#!/bin/sh
g.list rast
r.info ETOPO1_KKT_EAC
d.mon wx0
g.region raster=ETOPO1_KKT_EAC -p
r.colors ETOPO1_KKT_EAC col=grey.eq
d.rast ETOPO1_KKT_EAC
d.redraw
r.contour ETOPO1_KKT_EAC out=Bathymetry1000 step=1000
d.vect Bathymetry1000 color='blue' width=0
d.grid -g size=2.5 color='255:0:0'
d.text text="Equal Area Cylindrical prj" color='0:0:51' bgcolor='224:224:224' size=3
