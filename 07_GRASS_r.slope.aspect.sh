#!/bin/sh
# GRASS GIS script for plotting slope, aspect, profile and tangential curvature maps
d.mon wx0
g.region raster=ETOPO1_KKT_WGS84
r.slope.aspect elevation=ETOPO1_KKT_WGS84 slope=slope aspect=aspect pcurvature=pcurv tcurvature=tcurv
# set color tables for output raster maps
r.colors -n map=slope color=sepia
r.colors map=aspect color=aspectcolr
r.colors map=pcurv color=curvature
r.colors map=tcurv color=grey255
# display maps
# display slope map
d.mon wx1
d.rast slope
d.legend raster=slope
d.text text="Slope map" color=blue size=6
# display aspect map
d.mon wx2
d.rast aspect
d.legend raster=aspect
d.text text="Aspect map" color=blue bgcolor=white size=6
# display profile curvature map
d.mon wx3
d.rast pcurv
d.legend raster=pcurv
d.text text="Profile curvature" color=blue size=6
# display tangential curvature map
d.mon wx4
d.rast tcurv
d.legend raster=tcurv
d.text text="Tangential curvature" color=blue size=5
