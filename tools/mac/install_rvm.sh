#!/bin/sh
printf "This will install and configure brew, rvm and the gems required to test.\n"

echo "Check for brew issues...you can ignore minor warnings"
brew doctor
read -p "If there are errors, warnings, resolve before continuing or the update may fail. Any key to continue..."

brew update
read -p "If the update failed, try brew doctor and brew update until successful. Any key to continue..."

echo "Install xcode command line tools..."
xcode-select --install

echo "Checking for missing packages..."
for pkg in gnupg; do
    if brew list -1 | grep -q "^${pkg}\$"; then
        echo "Package '$pkg' is installed"
    else
        echo "Package '$pkg' is not installed. Installing '$pkg'"
        brew install "${pkg}"
    fi
done

echo "Add keystore for rvm"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

pushd ".."
. "configure_rvm.sh"