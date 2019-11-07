#!/bin/bash

DYLIB=$1
APP_PATH=$2
APP_NAME=$3

cp $DYLIB "$APP_PATH/Contents/MacOS/"
codesign --remove-signature "$APP_PATH/Contents/MacOS/$APP_NAME"
optool install -c load -p "@executable_path/$DYLIB" -t "$APP_PATH/Contents/MacOS/$APP_NAME"
codesign --deep -fs 9FB955AEDC0D6A78B791D765BDC75EAAB3D1EEF4 "$APP_PATH"

# sudo codesign --deep -fs SlavikHacker "$APP_PATH"