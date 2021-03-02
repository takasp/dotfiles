#!/bin/bash
#
# Setup MacOS configuration
#
set -euC

# Tap to click
defaults write -g com.apple.mouse.tapBehavior -int 1
# Tracking speed
defaults write -g com.apple.trackpad.scaling 3
# Drag with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# Delay Until Repeat
defaults write -g InitialKeyRepeat -int 10
# Key Repeat
defaults write -g KeyRepeat -int 1

# Assign Command key to Caps Lock
keyboard_vid=$(ioreg -p IOUSB -c IOUSBDevice -n 'Apple Internal Keyboard / Trackpad' -r | grep -E 'idVendor' | awk '{ print $3 }')
keyboard_pid=$(ioreg -p IOUSB -c IOUSBDevice -n 'Apple Internal Keyboard / Trackpad' -r | grep -E 'idProduct' | awk '{ print $3 }')
keyboard_id="${keyboard_vid}-${keyboard_pid}-0"

defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>
  <integer>30064771299</integer>
  <key>HIDKeyboardModifierMappingSrc</key>
  <integer>30064771129</integer>
</dict>
"

# Change "Move focus to next window" shortcut to Alt + Tab
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27 dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:enabled bool true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:type string standard" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters array" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters:0 integer 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters:1 integer 48" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:27:value:parameters:2 integer 524288" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Change the default location for saving screenshots.
defaults write com.apple.screencapture location ~/Pictures/

killall Finder
killall SystemUIServer

