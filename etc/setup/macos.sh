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
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>48</integer><integer>524288</integer></array><key>type</key><string>standard</string></dict></dict>"

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Change the default location for saving screenshots.
defaults write com.apple.screencapture location ~/Pictures/

killall Finder
killall SystemUIServer

