#
# Cookbook Name:: sstk-wp
# Recipe:: default
#
# Copyright 2014, Adam Staudt <astaudt@shutterstock.com>
#
# All rights reserved - Do Not Redistribute
#
hostname = "sstk-wp"

package 'ntp'

service 'ntpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

include_recipe "build-essential"
include_recipe "env_vars"
include_recipe "iptables::disabled"
include_recipe "nginx::source"

[
  "#{node['nginx']['dir']}/vhost.d",
  "#{node['nginx']['log_dir']}/vhost",
  "/var/www/wp"
].each do |dir|
  directory "#{dir}" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode 0755
  recursive true
  action :create
  end
end

template "#{node['nginx']['dir']}/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  notifies :reload, 'service[nginx]'
end

template "#{node['nginx']['dir']}/vhost.d/#{hostname}.conf" do
  source "#{hostname}.conf.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  notifies :reload, 'service[nginx]'
end

cookbook_file "/var/www/wp/index.html" do
  source "index.html"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode 0644
  action :create
end


mysql_service 'default' do
  server_root_password node['mysql']['server_root_password']
  action :create
end

file '/etc/hostname' do
  content "#{hostname}\n"
end

bash "set hostname to #{hostname}" do
  code <<-EOH
  hostname --file /etc/hostname
  EOH
end

