#!/bin/sh
echo "Install or updating rvm with ruby..."
\curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
echo "RVM installed. List rubies..."

source $HOME/.rvm/scripts/rvm
rvm reload
rvm list

echo "Install latest version"
rvm install 2.2.4
read -p "Fix any issues logged to the console. Any key to continue..."

echo "Create CM and merrill gemsets"
rvm gemset create datasite
rvm gemset create datasite-cm
gem update --system

echo "Navigating to ../core will load the right ruby and gemset."
echo "$PWD"
pushd "../"

echo "Install bundler and project gems"
gem install bundler
bundle config build.nokogiri --use-system-libraries

echo "Installing project gems from gemfile..."
bundle install

echo "Done! ready to run ruby."