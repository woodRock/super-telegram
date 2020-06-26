## MapServer 6.2 to 6.4 Migration

- [ ] The “ows_extent” layer metadata is not used anymore to obtain georeferencing information for unreferenced raster data. Please use the “extent” layer key instead
```
LAYER
  ...
  EXTENT -180 90 180 90
END
```
- [ ] Validation patterns cannot be specified in metadata blocks (i.e. using xxx_validation_pattern and default_xxx metadata entries), use VALIDATION blocks. see #4596 #4604 #4608 or Run-time Substitution

- [ ] Build has changed after the switch to cmake. Build instructions are included in the INSTALL.CMAKE file in the source directory. You will need to have cmake installed on your system. Users of mapscripts (except php) will also need swig to be installed.

- [ ] WFS paging parameter startIndex changed to base on 0 instead of 1 (0 is the first feature). See #4180 for external references.

- [ ] Template substitution tags were case-sensitive, they are now case-insensitive.

