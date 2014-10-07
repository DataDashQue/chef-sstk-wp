#
# Cookbook Name:: sstk-wp
# Recipe:: default
#
# Copyright 2014, Adam Staudt <astaudt@shutterstock.com>
#
# All rights reserved - Do Not Redistribute
#
hostname = "blog.shutterstock.com"

%w( git telnet nc findutils mlocate ).each do |pkg|
  package pkg
end

include_recipe "build-essential"
include_recipe "env_vars"
include_recipe "iptables::disabled"
include_recipe "wordpress::nginx"

template "#{node['nginx']['dir']}/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  notifies :reload, 'service[nginx]'
end

file '/etc/hostname' do
  content "#{hostname}\n"
end

bash "set hostname to #{hostname}" do
  code <<-EOH
  hostname --file /etc/hostname
  EOH
end

# this has to happen after setting the hostname to write the correct config
include_recipe "postfix"
