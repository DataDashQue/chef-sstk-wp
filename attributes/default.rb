# mysql attributes
default['mysql']['server_root_password'] = 'marketplace34'

# nginx attributes
default['nginx']['version'] = '1.6.1'
default['nginx']['source']['version'] = '1.6.1'
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
