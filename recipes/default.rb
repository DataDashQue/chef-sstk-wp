#
# Cookbook Name:: sstk-wp
# Recipe:: default
#
# Copyright 2014, Adam Staudt <astaudt@shutterstock.com>
#
# All rights reserved - Do Not Redistribute
#
package 'ntp'

service 'ntpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

include_recipe "build-essential"
include_recipe "env_vars"
include_recipe "nginx"
include_recipe "mysql::server"

file '/etc/hostname' do
  content "sstk-wp\n"
end

bash "set hostname to sstk-wp" do
  code <<-EOH
  hostname --file /etc/hostname
  EOH
end

file '/etc/hosts' do
  content "127.0.0.1 localhost\n192.168.33.10 sstk-wp\n"
end


