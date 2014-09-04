name             'sstk-wp'
maintainer       'Adam Staudt'
maintainer_email 'astaudt@shutterstock.com'
license          'All rights reserved'
description      'Installs/Configures sstk-wp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'build-essential'
depends 'env_vars'
depends 'iptables'
depends 'nginx'
depends 'mysql'