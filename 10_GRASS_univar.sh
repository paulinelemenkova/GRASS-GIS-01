#!/bin/sh
# GRASS GIS script: d.frame - Manages display frames on the user's graphics monitor.
g.list rast
g.region rast=ETOPO1_KKT_EAC -p
r.univar ETOPO1_KKT_EAC
r.univar KKRdem_d2_0001_final
r.univar KKRdem_d2_0050_final
r.univar KKRdem_d2_0100_final
#
r.report KKRdem_d2_0001_final unit=c,k,p
r.report KKRdem_d2_0001_final_aspect unit=c,k,p
#
# Gaussian surface
r.surf.gauss KKRdem_d2_0001_Gauss mean=100 sigma=10
d.histogram map=KKRdem_d2_0001_Gauss
d.rast.num KKRdem_d2_0001_final -a

#g.region -p n=228500 s=215000 w=630000 e=645000 res=10
g.region -p n=505200 s=515000 w=1550000 e=1565000 res=100
r.surf.random out=KKRrandom min=0 max=1000 --overwrite
# check result
r.univar KKRrandom
d.histogram map=KKRrandom
d.redraw
#
g.region raster=KKRdem_d2_0001_final_aspect -p
r.what map=KKRdem_d2_0001_final_aspect coordinates=776348,505200,846341,515000 -f
