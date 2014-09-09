#!/bin/bash

COOKBOOKS_PATH="/root/chef/cookbooks"

rm -rf $COOKBOOKS_PATH
(cd /root/cookbooks/sstk-wp ; berks vendor $COOKBOOKS_PATH)
chef-solo -c /root/chef/solo.rb -j /root/chef/solo.json
