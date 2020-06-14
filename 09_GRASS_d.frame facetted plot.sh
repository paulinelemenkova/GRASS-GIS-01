#!/bin/sh
# GRASS GIS script: d.frame - Manages display frames on the user's graphics monitor.
g.region rast=KKRdem_d2_0001_final -p
d.mon wx0
# 1st map
d.frame -c frame=first at=0,100,0,50 --overwrite
d.rast KKRdem_d2_0001_final
d.vect contours_20m0001 color='brown' width=0
d.grid -g size=2.5 color=white text_color=white
d.text text='DEM of fractal surface, dim=2.0001' bgcolor=220:220:220 color=black size=2
# 2nd map
d.frame -c frame=second at=0,100,50.1,100 --overwrite
r.colors KKRdem_d2_0001_final_aspect color=aspectcolr
d.rast KKRdem_d2_0001_final_aspect
d.grid -g size=2.5 color=grey
d.text text='Aspect of DEM of fractal surface' bgcolor=220:220:220 color=black size=2
