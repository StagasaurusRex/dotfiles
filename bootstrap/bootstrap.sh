#!/usr/bin/env bash

osascript -e 'tell application "System Preferences" to quit'

sudo -v

while true; do sudo -n true; sleep 60; \
    kill -0 "$$" || exit; done 2>/dev/null &

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

hash brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ""
echo "Done."
echo ""
echo "---"

echo ""
echo "Installing Applications..."
echo ""

brew bundle --file=$DIR/Brewfile
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

# Show indicator lights for open applications in the dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icon translucent on Hidden applications
defaults write com.apple.Dock showhidden -bool YES 

# Show 'Recent Applications' stack on dock
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

# Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't install macOS updates automatically
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

# Don't display prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Enable AptX for bluetooth audio
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true 

# Enable Full Screen Mode for iOS Simulator
defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES

echo ""
echo "Done."
echo ""
echo "---"

# Set keyboard shortcuts
echo ""
echo "Setting keyboard shortcuts"
echo ""
echo "---"

$DIR/shortcuts.sh

echo ""
echo "Done."
echo ""
echo "---"

echo ""
echo "Setting iterm2 preferences"
echo ""
echo "---"

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo ""
echo "Done."
echo ""
echo "---"

# Clone Shell Script Repo
echo ""
echo "Cloning Shell Script Github Repo"
echo ""

git clone git@github.com:StagasaurusRex/Shell-Scripts.git ~/bin/

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

echo ""
echo "Install gems..."
echo ""

sudo gem install colorls

echo ""
echo "Done."
echo ""
echo "---"

echo ""
echo "Installing Oh-My-Tmux..."
echo ""

ln -s -f ~/.homesick/repos/dotfiles/home/.tmux.conf ~/.tmux.conf

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
