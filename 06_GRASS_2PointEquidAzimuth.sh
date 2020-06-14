#!/bin/sh
g.list rast
r.info ETOPO1_KKT_2p
d.mon wx0
g.region raster=ETOPO1_KKT_2p -p
r.colors ETOPO1_KKT_2p col=grey.eq
d.rast ETOPO1_KKT_2p
d.redraw
r.contour ETOPO1_KKT_2p out=Bathymetry1000 step=1000
d.vect Bathymetry1000 color='blue' width=0
d.grid -g size=2.5 color='255:0:0'
d.text text="2 Point Equidist. Azimuth." color='0:0:51' bgcolor='224:224:224' size=3
