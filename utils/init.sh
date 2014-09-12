#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/opt/chefdk/embedded/bin:/opt/chefdk/bin

CHEFDK_URL="https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.2.1-1.el6.x86_64.rpm"
SSTK_WP_COOKBOOK_URL="https://github.shuttercorp.net/astaudt/chef-sstk-wp.git"

rpm -Uvh $CHEFDK_URL
yum install -y git
mkdir -p /root/chef /root/cookbooks

cat << EOF > /root/chef/solo.json
{
  "run_list": [ "recipe[sstk-wp::default]" ]
}
EOF

cat << EOF > /root/chef/solo.rb
root = File.absolute_path(File.dirname(__FILE__))

file_cache_path root
cookbook_path root + '/cookbooks'
data_bag_path cookbook_path + '/sstk-wp/data_bags'
encrypted_data_bag_secret "/tmp/wp_creds.key"
EOF

(cd /root/cookbooks && rm -rf chef-sstk-wp && git clone $SSTK_WP_COOKBOOK_URL && chef-sstk-wp/utils/run_chef.sh)
