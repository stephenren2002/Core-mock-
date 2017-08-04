# Install and run jenkins
## Setup Vagrant
1. Install virtual box https://www.virtualbox.org/
1. Install vagrant http://www.vagrantup.com/downloads
1. `vagrant install plugin docker`

## Setup Docker - skip unless necessary, vagrant should provide this
1. download and install https://www.docker.com/products/docker-toolbox

## Create vagrant config (if doesn't exist)
1. `vagrant -v` should work
1. `vagrant init jenkins http://goo.gl/OCBgKj`

## Run
1. `vagrant up`
1. `vagrant ssh`

## Jenkins Hardware requirements

## Jenkins required plugins
plugins.txt