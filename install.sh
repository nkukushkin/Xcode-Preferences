#!/usr/bin/env sh

XCODE_DIR=~/Library/Developer/Xcode

## Templates

TEMPLATES_SOURCE_DIR=Templates/File\ Templates
TEMPLATES_DESTINATION_DIR=$XCODE_DIR/Templates

if [ ! -d "$TEMPLATES_DESTINATION_DIR" ]; then
    mkdir -p "$TEMPLATES_DESTINATION_DIR"
fi

cp -R "$TEMPLATES_SOURCE_DIR" "$TEMPLATES_DESTINATION_DIR"

## UserData

USERDATA_SOURCE_DIR=UserData
USERDATA_DESTINATION_DIR=$XCODE_DIR

if [ ! -d "$USERDATA_DESTINATION_DIR" ]; then
    mkdir -p "$USERDATA_DESTINATION_DIR"
fi

cp -R "$USERDATA_SOURCE_DIR" "$USERDATA_DESTINATION_DIR"

## Preferences

# See https://github.com/aizatto/character-length
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool YES
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -integer 120

defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool YES
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool YES

defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool NO
defaults write com.apple.dt.Xcode DVTTextIndentTabWidth -integer 2
defaults write com.apple.dt.Xcode DVTTextIndentWidth -integer 2
defaults write com.apple.dt.Xcode DVTTextIndentSoloBraces -bool NO
defaults write com.apple.dt.Xcode DVTTextIndentCase -bool YES
defaults write com.apple.dt.Xcode DVTTextIndentCaseInC -bool YES
