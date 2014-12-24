name             'webserver'
maintainer       'Eric Bordeleau'
maintainer_email 'ebordeleau@myfastmail.com'
license          'all_rights'
description      'Installs/Configure a webserver'
long_description 'Installs/Configure a webserver with MYSQL database'
version          '0.1.0'

depends 'apache2'
depends 'apt'
depends 'php'
depends 'ark', '~> 0.9.0'
depends 'zip'
depends 'java'
depends 'mysqld'

recipe "webserver::mediawiki", "Download and Unzip of Mediawiki"
recipe "webserver::config_mysql", "Configuration of MySQL for Mediawiki"