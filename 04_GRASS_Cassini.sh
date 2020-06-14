#!/bin/sh
g.list rast
r.info ETOPO1_KKT_C
d.mon wx0
g.region raster=ETOPO1_KKT_C -p
r.colors ETOPO1_KKT_C col=grey.eq
d.rast ETOPO1_KKT_C
d.redraw
r.contour ETOPO1_KKT_C out=Bathymetry1000C step=1000
d.vect Bathymetry1000C color='blue' width=0
d.grid -g size=2.5 color='255:0:0'
d.text text="Cassini-Soldner prj" color='0:0:51' bgcolor='224:224:224' size=3
