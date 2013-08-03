Device configuration for the ZTE Roamer
=======================================

Copyright (C) 2011 The CyanogenMod Project

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0


## Description

  This repository is for CM7 on ZTE Roamer.

  It is still a work in progress.
  

## Requirements
 * perl
 * jdk 6
 * python 2


## How To Build CM7 for ZTE Roamer

###  Make a workspace
```bash
  $ mkdir -p ~/android/system
  $ cd ~/android/system
```

###  Do repo init & sync
```bash
  $ repo init -u git://github.com/CyanogenMod/android.git -b gingerbread
  $ repo sync -j16 -c
```

###  Setup vendor
```bash
  $ cd vendor/cyanogen/
  $ ./get-rommanager
```

###  Add to local manifest
Add the following to `.repo/local_manifests/zte_roamer.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
  <manifest>
    <project name="bwrsandman/android_device_zte_roamer" path="device/zte/roamer" remote="github" revision="gingerbread" />
    <project name="bwrsandman/android_kernel_zte_roamer" path="kernel/zte/roamer" remote="github" revision="gingerbread" />
    <project name="bwrsandman/android_vendor_zte_roamer" path="vendor/zte/roamer" remote="github" revision="gingerbread" />
  </manifest>
```
Update your repo:
```bash
$ repo sync
```

###  Setup device
After the source downloads, ensure you are in the root of the source code (`cd ~/android/system`), connect phone to USB and make sure debugging is available for adb pulls:
```bash
  $ cd device/zte/roamer/
  $ ./extract-files.sh
```
This pulls files from a working roamer with most variants of shipped ZTE ROM.

###  Setup environment
```bash
  $ source build/envsetup.sh
  $ lunch full_roamer-eng
```

###  Build CM7
```bash
  $ make acp # (to avoid errors on distributed building)
  $ make bacon
```

## Troubleshooting

### "device/htc/ace/ace.mk" does not exist.
If running make results in the following error:
```
build/core/product_config.mk:196: *** _nic.PRODUCTS.[[vendor/cyanogen/products/cyanogen_ace.mk]]: "device/htc/ace/ace.mk" does not exist.  Stop.
Device roamer not found. Attempting to retrieve device repository from CyanogenMod Github (http://github.com/CyanogenMod).
```
remove `vendor/cyanogen/products/AndroidProducts.mk`

### `Unknown parameter a interfaceName for tags/attrs`
If the build fails while running `external/webkit/WebCore/dom/make_names.pl`, such as:
```
target Generated: libwebcore <= external/webkit/WebCore/dom/make_names.pl
given is experimental at external/webkit/WebCore/dom/make_names.pl line 207.
when is experimental at external/webkit/WebCore/dom/make_names.pl line 208.
when is experimental at external/webkit/WebCore/dom/make_names.pl line 211.
Unknown parameter a interfaceName for tags/attrs
make: *** [out/target/product/roamer/obj/STATIC_LIBRARIES/libwebcore_intermediates/WebCore/HTMLNames.h] Error 255
```

Edit `external/webkit/WebCore/dom/make_names.pl` and replace 
```perl
my $preprocessor = "/usr/bin/gcc -E -P -x c++";
```
with 
```perl
my $preprocessor = "/usr/bin/gcc -E -x c++";
```

### Python scripts output errors
On ArchLinux and other platforms, the default python version is python3. 
The CyanogenMod project uses python2 which causes some syntax errors such as:
```
  File "external/qemu/android/tools/gen-hw-config.py", line 52
    print "Usage: %s source target\n" % os.path.basename(sys.argv[0])
                                    ^
SyntaxError: invalid syntax
```
This is remedied by replacing:
```
#!/usr/bin/env python
```
with:
```
#!/usr/bin/env python2
```
in associated python scripts.
