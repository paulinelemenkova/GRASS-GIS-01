#!/bin/sh
# GRASS GIS script for creating a fractal surface of a given fractal dimension.
g.list rast
d.mon wx0
g.region -p raster=ETOPO1_KKT_EAC
r.colors ETOPO1_KKT_EAC col=etopo2
d.rast ETOPO1_KKT_EAC
d.text text="Kuril-Kamchatka Area" color='255:255:255' size=3
r.contour ETOPO1_KKT_EAC out=Bathymetry750 step=750 --overwrite
d.vect Bathymetry750 color='blue' width=0
#
r.surf.fractal output=KKRfractals
r.colors map=KKRfractals color=byr
r.relief input=KKRfractals output=KKRfractals_shade
d.mon wx1
d.shade shade=KKRfractals_shade color=KKRfractals b=50
r.info KKRfractals_shade
d.text text="Fractals DEM shade map" color='0:0:51' bgcolor='224:224:224' size=3
#
# D=2.0001
g.region -dp
r.surf.fractal out=KKRdem_d2_0001 dim=2.0001
r.info -r KKRdem_d2_0001
r.mapcalc "KKRdem_d2_0001_final = 1.0 * KKRdem_d2_0001 + abs(min(KKRdem_d2_0001))"
r.colors KKRdem_d2_0001_final color=terrain
r.slope.aspect KKRdem_d2_0001_final aspect=KKRdem_d2_0001_final_aspect
#
d.mon wx2
r.colors KKRdem_d2_0001_final color=elevation
d.rast KKRdem_d2_0001_final
d.grid -g size=2.5 color=white text_color=white
r.contour input=KKRdem_d2_0001_final output=contours_20m0001 step=20
d.vect contours_20m0001 color='brown' width=0
d.text text="Fractal surface, dim=2.0001" color='0:0:51' bgcolor='224:224:224' size=2 linespacing=1.0
#
d.mon wx3
r.colors KKRdem_d2_0001_final_aspect color=aspectcolr
d.rast KKRdem_d2_0001_final_aspect
d.grid -g size=2.5 color=grey
d.text text="Aspect map" color='0:0:51' bgcolor='224:224:224' size=3
d.legend raster=KKRdem_d2_0001_final_aspect title=Aspect title_fontsize=8 \
font=Helvetica fontsize=8 -t -b bgcolor='white' label_step=2000 border_color=gray -f thin=8
#
# D=2.0500
g.region -dp
r.surf.fractal out=KKRdem_d2_0050 dim=2.0050 --overwrite
r.info -r KKRdem_d2_0050
r.mapcalc "KKRdem_d2_0050_final = 1.0 * KKRdem_d2_0050 + abs(min(KKRdem_d2_0050))" --overwrite
r.slope.aspect KKRdem_d2_0050_final aspect=KKRdem_d2_0050_final_aspect --overwrite
#
d.mon wx0
r.colors KKRdem_d2_0050_final color=elevation
d.rast KKRdem_d2_0050_final
d.grid -g size=2.5 color=white text_color=white
r.contour input=KKRdem_d2_0050_final output=contours_20m0050 step=20
d.vect contours_20m0050 color='brown' width=0
d.text text="Fractal surface, dim=2.0050" color='0:0:51' bgcolor='224:224:224' size=2 linespacing=1.0
#
d.mon wx1
r.colors KKRdem_d2_0050_final_aspect color=aspectcolr
d.rast KKRdem_d2_0050_final_aspect
d.grid -g size=2.5 color=grey
d.text text="Aspect map" color='0:0:51' bgcolor='224:224:224' size=3
#
# D=2.0100
r.surf.fractal out=KKRdem_d2_0100 dim=2.0100
r.info -r KKRdem_d2_0100
r.mapcalc "KKRdem_d2_0100_final = 1.0 * KKRdem_d2_0100 + abs(min(KKRdem_d2_0100))"
r.slope.aspect KKRdem_d2_0100_final aspect=KKRdem_d2_0100_final_aspect
#
d.mon wx2
r.colors KKRdem_d2_0100_final color=elevation
d.rast KKRdem_d2_0100_final
d.grid -g size=2.5 color=white text_color=white
r.contour input=KKRdem_d2_0100_final output=contours_20m step=20
d.vect contours_20m color='brown' width=0
d.text text="Fractal surface, dim=2.0100" color='0:0:51' bgcolor='224:224:224' size=2 linespacing=1.0
#
d.mon wx3
r.colors KKRdem_d2_0100_final_aspect color=aspectcolr
d.rast KKRdem_d2_0100_final_aspect
d.grid -g size=2.5 color=grey
d.text text="Aspect map" color='0:0:51' bgcolor='224:224:224' size=2
