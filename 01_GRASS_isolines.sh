#!/bin/sh
# GRASS GIS script for plotting isolines by r.contour
d.mon wx0
r.info ETOPO1_KKT_WGS84
g.region raster=ETOPO1_KKT_WGS84 -p
r.colors ETOPO1_KKT_WGS84 col=elevation
d.rast ETOPO1_KKT_WGS84
d.grid size=03:00:00 -a -d color=red width=0.1 fontsize=8 text_color=black
d.text text="Kuril-Kamchatka Area" color='255:255:255' size=5
r.contour ETOPO1_KKT_WGS84 out=Bathymetry750 step=750 --overwrite
d.vect Bathymetry750 color='blue' width=0
d.legend raster=ETOPO1_KKT_WGS84 title=Elevation,m title_fontsize=8 \
	font=Helvetica fontsize=8 -t -b bgcolor='255:255:204' label_step=2000 border_color=gray -f thin=8
