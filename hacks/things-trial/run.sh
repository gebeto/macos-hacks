#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export DYLD_INSERT_LIBRARIES=$DIR/libthingstrial.dylib
/Users/gebeto/Desktop/Things3.app/Contents/MacOS/Things3
# /Applications/Things.app/Contents/MacOS/Sketch
