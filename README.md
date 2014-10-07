sstk-wp Cookbook
================
This cookbook configures a node to act as a Shutterstock Blog (Wordpress)
server. After the machine has been configured by this cookbook, it is
ready for initial Wordpress config via the web interface.

Attributes
----------
See `attributes/default.rb`

Usage
-----
#### sstk-wp::default

This recipe is designed to be used during a chef-solo run. Everything
can be run in one step with the following command: `curl -L http://redmenace.su/sstk-wp-init.sh | bash`

Development
-----------
This cookbook ships with a Vagrantfile which uses chef-solo as a
provisioner to configure the machine. Simply do a `vagrant up` from
the base directory of this cookbook. The usual prerequisites for using
Vagrant apply - i.e. working local install of VirtualBox. You also need
Berkshelf installed locally. I recommend using ChefDK: `https://downloads.getchef.com/chef-dk/`.

License and Authors
-------------------
Authors: Adam Staudt <astaudt@shutterstock.com>
