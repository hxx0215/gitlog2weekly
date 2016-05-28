#!/bin/sh

# Based on https://gist.github.com/neonichu/9487584
# Now automatically updates every plugin for every version of Xcode on your machine

PLIST_BUDDY=/usr/libexec/PlistBuddy

function add_compatibility() {
  "$PLIST_BUDDY" -c "Add DVTPlugInCompatibilityUUIDs:10 string $2" \
    "$1/Contents/Info.plist"
}

function has_compatibility() {
  $PLIST_BUDDY -c 'Print DVTPlugInCompatibilityUUIDs' \
    "$1/Contents/Info.plist"|grep -q "$2"
  return $?
}

function get_UUID() {
  $PLIST_BUDDY -c 'Print DVTPlugInCompatibilityUUID' \
    "$1/Contents/Info.plist"
    return $?
}

cd "/Applications"
for xcode in `ls -d Xcode*`
do

  UUID=`get_UUID "/Applications/$xcode"`
  echo "$xcode: $UUID"

  cd "$HOME/Library/Application Support/Developer/Shared/Xcode/Plug-ins"
  for file in `ls -d *`
  do
    if `has_compatibility "$file" $UUID`
    then
      true
    else
      echo "Plugin $file is now compatible with $xcode"
      add_compatibility "$file" $UUID
    fi
  done

done