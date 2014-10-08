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

NOTE: The initial provisioning run may not write postfix config
files with correct variables. This is a known bug, and can be worked
around by simply doing another chef run to re-converge the node. This
has to do with when and how the host's hostname is set.

Development
-----------
This cookbook ships with a Vagrantfile which uses chef-solo as a
provisioner to configure the machine. Simply do a `vagrant up` from
the base directory of this cookbook. The usual prerequisites for using
Vagrant apply - i.e. working local install of VirtualBox. You also need
Berkshelf installed locally. I recommend using ChefDK: `https://downloads.getchef.com/chef-dk/`.

Additionally, there is a `.kitchen.yml` file which you can use to
provision a vagrant vm via Chef Kitchen. This runs a few additional
tests on the provisioned node. TODO: add more tests, consider using
the `kitchen-ec2` plugin to test on AWS instances.

License and Authors
-------------------
Authors: Adam Staudt <astaudt@shutterstock.com>
