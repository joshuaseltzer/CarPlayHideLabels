#!/bin/bash

# use the Xcode 11 toolchain to ensure arm64e compatibility on iOS 12 and iOS 13
export PREFIX=$THEOS/toolchain/Xcode11.xctoolchain/usr/bin/

# build the rootful package
make clean
make package FINALPACKAGE=1

# move the filter plist file temporarily for the rootless build
mv -n CarPlayHideLabels.plist CarPlayHideLabels_rootful.plist
mv -n CarPlayHideLabels_rootless.plist CarPlayHideLabels.plist

# build the rootless package
export -n PREFIX
make clean
make package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless

# return the filter plist files back to their original states
mv -n CarPlayHideLabels.plist CarPlayHideLabels_rootless.plist
mv -n CarPlayHideLabels_rootful.plist CarPlayHideLabels.plist