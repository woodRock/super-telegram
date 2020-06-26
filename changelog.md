# MapServer 6.4 to 7.0 Migration

- [ ] The predefined field names for the union and cluster layers have been changed. Colons in the field names have been replaced with underscores to avoid producing invalid GetFeatureInfo results. The field names in the mapfiles should be modified according to this change.

- [ ] Layer FILTERs must use MapServer expression syntax only. Drivers will attempt to translate from MapServer syntax to native syntax (e.g. SQL). Native expressions can still be set either using: 1) sub-selects in the DATA statement or 2) using the new NATIVE_FILTER processing key.

## OGR Layer Before
```
LAYER
  ...
  FILTER 'where id=234'
END
```

## OGR Layer After
```
LAYER
  ...
  PROCESSING 'NATIVE_FILTER=id=234'
END
```

- [ ] MapServer attribute queries (e.g. mode=item[n]query) must be specified using MapServer expression syntax (qstring and qitem (opt)). For RDBMS backends you no longer send SQL snippets, rather the underlying driver will attempt to translate the expression to native systax (e.g. SQL). If translation fails (or the driver doesn’t support translation) then MapServer will evaluate the expression instead.

- [ ] Layer opacity is now deprecated a result of RFC 113 - Layer Compositing. The mapfile parser and MapScript getter/setter functions will continue to function but unpredictable results will occur if used in conjunction with COMPOSITE blocks. For more information see http://www.mapserver.org/development/rfc/ms-rfc-113.html.

## Before
```
LAYER
  ...
  OPACITY 70
END
```
## After
```
LAYER
  ...
  COMPOSITE
    OPACITY 70
  END
END
```

- [ ] Handling of non UTF-8 encoded datasources has changed with RFC103. Mapfiles now must be saved in UTF-8 encoding, and requests returned by MapServer will always be UTF-8 encoded. Various “xxx_encoding” metadata entries used to hack around non UTF-8 encoded datasources are now obsolete, and have been replaced by a LAYER-level ENCODING keyword.

- [ ] Native ESRI SDE layers are no longer supported (see https://github.com/mapserver/mapserver/pull/5068). OGR remains an alternative for those that really need it although the OGR/SDE driver suffers from the same issues that prompted the removal from MapServer.

- [ ] GD graphics library support was removed (http://www.mapserver.org/development/rfc/ms-rfc-99.html) and had been optional since 6.2.

  - [ ] GIF output cannot be produced from MapServer although 8-bit PNG output can be be produced using the AGG/PNG8 driver.

  - [ ] Bitmap fonts have been replaced with an embedded TrueType font (see http://www.mapserver.org/development/rfc/ms-rfc-104.html)

- [ ] RFC 98 - Label/Text Rendering Overhaul (http://www.mapserver.org/development/rfc/ms-rfc-98.html) may result in subtle label/character placement changes. Support for negative MAXLENGTH that implied forced linebreaks is not supported anymore, workaround implies pre-processing such labels to include linebreaks or wrap characters.

- [ ] ExternalGraphics added through SLD must now validate against the “sld_external_graphic” entry of the MAP->WEB->VALIDATION block

```
MAP
 WEB
  VALIDATION
   "sld_external_graphic" "^/path/to/symbols/.*png"
  END
 END
END
```

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

