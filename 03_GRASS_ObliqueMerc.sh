#!/bin/sh
g.list rast
r.info ETOPO1_KKT_OM
d.mon wx0
g.region raster=ETOPO1_KKT_OM -p
r.colors ETOPO1_KKT_OM col=grey.eq
d.rast ETOPO1_KKT_OM
r.contour ETOPO1_KKT_OM out=Bathymetry1000OM step=1000
d.vect Bathymetry1000OM color='blue' width=0
d.grid -g size=2.5 color='255:0:0'
d.text text="Oblique Mercator prj" color='0:0:51' bgcolor='224:224:224' size=3
