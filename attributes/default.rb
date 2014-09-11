# mysql attributes
default['mysql']['server_root_password'] = 'marketplace34'

# nginx attributes
default['nginx']['version'] = '1.6.1'
default['nginx']['source']['version'] = '1.6.1'
# in case you forget, this checksum is generated by doing a
# "shasum -a 256 <source tarball>"
default['nginx']['source']['checksum'] = 'f5cfe682a1aeef4602c2ca705402d5049b748f946563f41d8256c18674836067'
default['nginx']['source']['prefix'] = "/opt/nginx-#{node['nginx']['source']['version']}"
default['nginx']['source']['url'] = "http://nginx.org/download/nginx-#{node['nginx']['source']['version']}.tar.gz"
default['nginx']['source']['sbin_path'] = "#{node['nginx']['source']['prefix']}/sbin/nginx"
default['nginx']['source']['default_configure_flags'] = [
  "--prefix=#{node['nginx']['source']['prefix']}",
  "--conf-path=#{node['nginx']['dir']}/nginx.conf",
  "--sbin-path=#{node['nginx']['source']['sbin_path']}"
]
default['nginx']['openssl_source']['version'] = '1.0.1i'
default['nginx']['init_style'] = 'init'
default['nginx']['client_max_body_size'] = '100m'

# wordpress attributes
default['wordpress']['version'] = 'latest'
default['wordpress']['db']['user'] = "sstkdbadmin"
default['wordpress']['db']['pass'] = 'C>+{9&TYuVme3HHxLpxa+R'
default['wordpress']['install']['user'] = node['nginx']['user']
default['wordpress']['install']['group'] = node['nginx']['group']
default['wordpress']['allow_multisite'] = true
default['wordpress']['server_name'] = 'blog.shutterstock.com'
default['wordpress']['fpm_port'] = '9001'

# postfix attributes
default['postfix']['main']['inet_interfaces'] = 'loopback-only'
    # probably need to change this!
default['postfix']['main']['relayhost'] = 'localhost'