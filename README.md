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


## How To Build CM7 for ZTE Roamer

###  Make a workspace
```bash
  $ mkdir -p ~/android/system
  $ cd ~/android/system
```

###  Do repo init & sync
```bash
  $ repo init -u git://github.com/CyanogenMod/android.git -b gingerbread
  $ repo sync -j16
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
