#
# Cookbook Name:: sstk-wp
# Recipe:: default
#
# Copyright 2014, Adam Staudt <astaudt@shutterstock.com>
#
# All rights reserved - Do Not Redistribute
#

# set the hostname
hostname = "blog.shutterstock.com"

file '/etc/hostname' do
  content "#{hostname}\n"
end

bash "set hostname to #{hostname}" do
  code <<-EOH
  hostname --file /etc/hostname
  EOH
end

# install a few packages we need
%w( git telnet nc findutils mlocate ).each do |pkg|
  package pkg
end

# pull in recipes to do some scaffolding work and install/configure wordpress
include_recipe "build-essential"
include_recipe "env_vars"
include_recipe "iptables::disabled"
include_recipe "wordpress::nginx"

# write the true nginx config
template "#{node['nginx']['dir']}/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  notifies :reload, 'service[nginx]'
end

# this has to happen after setting the hostname to write the correct config
# but NOTE: this doesn't seem to work correctly on the initial provisioning
# chef run. a second chef run is required to converge the variables in the
# config file correctly
include_recipe "postfix"
