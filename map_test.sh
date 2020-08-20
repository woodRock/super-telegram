#!/bin/bash

##  This is a script to test is a mapfile can be generated
##  It uses the shp2img command to generate an image from a mapfile
##  If it cannot be rendedred, errors will be written to stdout

MAP=/usr/lib/cgi-bin/mapfiles/stations.map;
OUT=test.png;

echo -e "Test: Convert Stations $MAP to $OUT PNG image\n";
shp2img -m $MAP $OUT;
