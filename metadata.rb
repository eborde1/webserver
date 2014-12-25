name             'webserver'
maintainer       'Eric Bordeleau'
maintainer_email 'ebordeleau@myfastmail.com'
license          'all_rights'
description      'Installs/Configure a webserver'
long_description 'Installs/Configure a webserver with MYSQL database'
version          '0.1.0'

depends 'apache2'
depends 'apt', '~> 2.6.0'
depends 'ark', '~> 0.9.0'
depends 'zip', '~> 1.1.0'
depends 'java', '~> 1.29.0'
depends 'php', '~> 1.5.0'
depends 'mysqld', '~> 1.0.0'


recipe "webserver::mediawiki", "Download and Unzip of Mediawiki"
recipe "webserver::config_mysql", "Configuration of MySQL for Mediawiki"

