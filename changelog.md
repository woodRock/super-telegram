# Change Log 
This file stores the relevant changes from the Mapserver Changelogs. It will evaluate whether each change will effect the current Mapfiles for the new WMS.



## Changes from 6.4.5 to 6.4.6
- [x] handle phpmapscript vulnerability in error handling ( #6014 ) (Jeff McKenna) : a2614cb
- [x] Fix potential XSS issue with [layers] tag. (Steve Lime) : d27b8b5
- [x] mapimagio.c: backport support for giflib >= 5.1 (Even Rouault) : e349792
- [x] security fix (Jeff McKenna) : f096b13

## Changes from 6.4.4 to 6.4.5
- [x] Security release for CVE-2017-5522
- [x] Fix cluster with WMS dimension issue ( #5364 ) (Tamas Szekeres) : 45b3594

## Changes from 6.4.3 to 6.4.4
- [x] Security release for CVE-2016-9839
- [x] Backport #4928 and #5356 (Thomas Bonfort) : 022d24b
- [x] fix typo on PERCENTAGES in mapfile writer (Thomas Bonfort) : a0437f8
- [x] This patch is to fix the issue “GetCapabilities request is extremely slow when “OWS_LAYER_GROUP” is used” (aabhayas) : 55558b3

## Changes from 6.4.2 to 6.4.3
- [x] Contour layer: support tileindex and WMS time ( #5212 ) (Even Rouault) : a752e70
- [x] Fix memory leak when loading FORMATOPTIONS ( #5149 ) (Thomas Bonfort) : 4df5f9f
- [x] Allow empty items in inline features ( #5182 ) (Thomas Bonfort) : f404adf
- [x] Fix mapscript saving of numbers in exp format ( #5014 ) (Thomas Bonfort) : ed7d3f6
- [x] Fixed case when drawing legend shapes with style geomtransforms. ( #5193 ) (Steve Lime) : 4f7d463
Added to the list of bugs 
- [x] Fixed label placement computation issue with thin polygons. ( #5234 ) (Steve Lime) : 078a6a3
- [x] Discard labels outside image extent when using masks ( #5237 ) (Thomas Bonfort) : 4196ac3
- [x] SLD: support LayerFeatureConstraints/FeatureTypeConstraint/Filter ( #4025 ) (Even Rouault) : c391b86
- [x] Fixed a bug (see #5157 ) where converting points from pixel to image coordinates with the shpxy tag was happening twice. (Steve Lime) : c8f813d
- [x] handle the case where include_dirs is set in distutils.cfg (Tomasz Pajor) : f6805a1

## Changes from 6.4.1 to 6.4.2
- [x] Prevent XML external entities from being fetched with libxml2 < 2.9.0 (Even Rouault) : 6600f47
```bash 
$cat *.map | grep -Hrn xml
```
This returns one mapfile that contains XML. This is a URI that refers to the medtadata for a layer. However this section is commented out. Therefore this change is not relevant
This returns one file that.
- [x] Correcting and harmonizing exceptionCode and locator usage in WCS ( #4388 ). (Stephan Meissl) : c37b3bc
- [x] Fix builds with Visual Studio 2013 ( #5059 ) (Tamas Szekeres) : 0efde12
- [x] Fix security exception for the MSVC2010+ compilers ( #3438 ) (Tamas Szekeres) : ae6806f
- [x] Add support for Oracle Spatial 12.1 ( #4901 ) (Tamas Szekeres) : d6baeb5
- [x] Added a check to msFreeCharArray() to bail if the array itself is NULL. (Steve Lime) : 278f347
- [x] Added default outputformats which fixes missing default formats when only the ServiceMetadata section is requested. (Fabian Schindler) : 8dab0b6
- [x] Update CMakeLists.txt (Jackey Cheung) : f6c6230
- [x] use execute_process instead of exec_program in FindAPACHE.cmake ( #4948 ) (Ezequiel Lara Gómez) : 644d750
- [x] Fix postgis installation on travis CI (Thomas Bonfort) : 9207e86
- [x] Fixed the typo in resetClassStyle ( #4971 ) (Tamas Szekeres) : ac1bc49
- [x] Use php://input instead of raw_post_data to support PHP 5.6. (Bas Couwenberg) : fc99472
- [x] Fix failed assertion with non-existant svg symbols ( #4899 ) (Francois Blackburn) : 83e4ee8
- [x] Don’t apply scalefactor on legend keyimage ( #4885 ) (Thomas Bonfort) : 7b86158
```bash
$cat *.map | grep RESOLUTION  # cmd 1
$cat *.map | grep KEYIMAGE    # cmd 2
```
Command 1 yeilds one usage of RESOLUTION. 
However command 2 reveals there are no usages of KEYIMAGE. Therefore this change will not have an effect.
- [ ] Fixing a large number of programming errors found by static analysis (Thomas Bonfort) : 55a5688
- [ ] Switch off ogr-output streaming mode for non default io contexts ( #4858 ) (Thomas Bonfort) : 3d174b4
```bash 
$cat *.map | grep FORMATOPTION
```
This command reveals that `FORMATOPTION` is used three times. None of these usages are of type stream however. So this patch will not have an effect.
- [x] Restore lexer file pointer on INCLUDE error ( #4871 ) (Thomas Bonfort) : 74f9382
- [x] Fix blending of semi-opaque pixels in average and bilinear resamplers ( #4875 ) (Thomas Bonfort) : fa29db4
- [x] msOGRFileClose: drop useless OGR mutex that could cause a dead-lock with tileindex ( #4869 ) (Even Rouault) : 51f98b0
- [x] Adjusting INSPIRE WMS 1.1.1 capabilities. Fixes #4861 . (Stephan Meissl) : b49c847
- [x] Escape backslashes in the mapfile string writer ( #4747 ) (Tamas Szekeres) : 94ca8b7
one file has escaped backslashes
```bash 
$cat *.map | grep '\\'
```
- [x] add SVG_INCLUDE_DIR so that svg.h is found (cnieman) : baef2ec
