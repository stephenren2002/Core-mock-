# Test Automation Framework Tools

## Configure proxy or use WIFI

**NOTE: Merrill blocks external dependencies unless run through proxy.**

### Mac

Run the following commands and enter your credentials:

       cp mac/.curlrc.example ~/.curlrc
       sudo nano ~/.curlrc
       
Enter the following in terminal with your credentials or copy from mac/.bash_profile.example into ~/.bash_profile:
       
       echo 'export HTTP_PROXY=inetproxy:80' >>~/.bash_profile
       echo 'export HTTP_PROXY_USER=username' >>~/.bash_profile
       echo 'export HTTP_PROXY_PASS=password' >>~/.bash_profile
       
       
### Windows

Set windows environment vars:

       HTTP_PROXY=inetproxy:80
       HTTP_PROXY_USER=username
       HTTP_PROXY_PASS=pw
       

## Git config for --first time

       git config --global user.name "John Doe"
       
       git config --global user.email johndoe@example.com
       
       git config --global core.editor nano
       
       git config --global push.default simple
       
       git config --global merge.tool p4merge
       
       git config --global mergetool.p4merge.path /Applications/p4merge.app/Contents/MacOS/p4merge
       
       git config http.sslVerify false

## Installing and configuring RVM for Mac
TODO: windows/mac prerequisites

       cd mac
       . install_rvm.sh
       
## Installing on Windows without cygwin(easier)

[Download the latest installer] (http://rubyinstaller.org/)

[Install ruby dev kit] (https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)

confirm installed:

       ruby -v
       
       gem -v
       
       gem install bundler

       bundle install

## Installing RVM/Cygwin for Windows

**Useful Links:**

http://blog.developwithpassion.com/2012/03/30/installing-rvm-with-cygwin-on-windows/

**Instructions:**

Follow instructions: [http://www.technixupdate.com/download-cygwin-full-setup-offline-installer/ and install cygwin from tools/cygwin_install]

Install the following packages/flipping anything from local installer from skip to version should get them:
       
       openssl – bin and sources
       
       openssh – Only if you are not going to compile openssh yourself
       
       curl – download internet resources
       
       libtool – Shared library generation tool. You’ll need it when trying to compile rubies
       
       libncurses-devel – Used when compiling several other tools I use
       
       make
       
       gcc
       
       openssl-devel – Required for compiling openssh (not necessarily required for rvm, but I always install it to compile openssh myself)
       
       libyaml
       
       libyaml-dev
       
       ncurses – Enabling better handling of terminal
       
       patch – Apply a diff file to an original. Again, you’ll need it when rvm is trying to patch the ruby installs
       
       zlib
       
       zlib-devel
       
       readline
       
       colorgcc
       
       gcc
       
       gcc-core – compiler
       
       nano
       
edit 

       nano ~/.bash_profile 
       export SHELLOPTS
       set -o igncr
          
Run the script

       cd tools
       . configure_rvm.sh