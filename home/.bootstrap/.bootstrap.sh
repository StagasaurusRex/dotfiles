#!/usr/bin/env bash

osascript -e 'tell application "System Preferences" to quit'

sudo -v

while true; do sudo -n true; sleep 60; \
    kill -0 "$$" || exit; done 2>/dev/null &

# Software Update

echo ""
echo "Updating macOS..."
echo ""

sudo softwareupdate -i -a

echo ""
echo "Done."
echo ""
echo "---"

# Xcode developer tools

echo ""
echo "Installing Xcode developer tools..."
echo ""

xcode-select --install
sudo xcodebuild -license accept

echo ""
echo "Done."
echo ""
echo "---"

# Homebrew

echo ""
echo "Installing Homebrew..."
echo ""

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo "Done."
echo ""
echo "---"

echo ""
echo "Installing Applications..."
echo ""

brew bundle
brew prune
brew cleanup

echo ""
echo "Done."
echo ""
echo "---"

# Preferences

echo ""
echo "Setting preferences..."
echo ""

# Disable Gatekeeper
sudo spctl --master-disable

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist


# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

echo ""
echo "Done."
echo ""
echo "---"

# SF Mono

echo ""
echo "Copying SF Mono"
echo ""

cp -v /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts

echo ""
echo "Done."
echo ""
echo "---"

# Gimoji Command Line

echo ""
echo "Installing Gitmoji-Cli..."
echo ""

npm i -g gitmoji-cli

echo ""
echo "Done."
echo ""
echo "---"

# Homesick

echo ""
echo "Install Homesick and dotfiles..."
echo ""

sudo gem install homesick
homesick clone StagasaurusRex/dotfiles
homesick link --quiet --force dotfiles

echo ""
echo "Done."
echo ""
echo "---"

# Change Shell

echo ""
echo "Changing default shell..."
echo ""

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

echo ""
echo "Done."
echo ""
echo "---"

# Git

echo ""
echo "Setting up git..."
echo ""

git config --global core.excludesfile ~/.gitignore

echo ""
echo "Done."
echo ""
echo "---"

# Dock

echo ""
echo "Setting up Dock..."
echo ""

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

/usr/local/bin/dockutil --add /Applications/Safari.app
/usr/local/bin/dockutil --add /Applications/Bear.app
/usr/local/bin/dockutil --add /Applications/Omnifocus.app
/usr/local/bin/dockutil --add /Applications/Spotify.app
/usr/local/bin/dockutil --add /Applications/iTerm.app

echo ""
echo "Done."
echo ""
echo "---"

echo ""
echo "Restarting finder and dock"
echo ""

sudo killall Finder
sudo killall Dock

echo ""
echo "Done."
echo ""
echo "---"
