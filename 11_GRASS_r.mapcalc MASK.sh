#!/bin/sh
# GRASS GIS script
g.list rast
d.mon wx0
# set the region, display the input maps and create a MASK g.region rast=elevation -p
d.erase
r.colors ETOPO1_KKT_EAC col=srtm
d.rast ETOPO1_KKT_EAC
r.mapcalc "MASK=if(ETOPO1_KKT_EAC > 0 && ETOPO1_KKT_EAC < 5000)"
# display elevation again to see the MASK effect d.rast elevation
# rename MASK to disable it, and display elevation again g.rename rast=MASK,maskfile
d.rast MASK
d.grid -g size=2.5 color='255:0:0'
d.text text="Masked land, SRTM colors" color='0:0:51' bgcolor='224:224:224' size=2
