#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/opt/chefdk/embedded/bin:/opt/chefdk/bin

CHEFDK_URL="https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.2.1-1.el6.x86_64.rpm"
SSTK_WP_COOKBOOK_URL="https://github.shuttercorp.net/astaudt/chef-sstk-wp.git"

rpm -Uvh $CHEFDK_URL
yum install -y git
mkdir /root/chef /root/cookbooks
(cd /root/cookbooks && git clone $SSTK_WP_COOKBOOK_URL && chef-sstk-wp/utils/run_chef.sh)
