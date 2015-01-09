# Oracle Java
default['java']['install_flavor']	 = "oracle"
default['java']['jdk_version']   	 = "7"
default['java']['arch']				 = "x86_64"
default['java']['ark_retries'] 		 = 2
default['java']['ark_retry_delay'] 	 = 5
default['java']['oracle']['accept_oracle_download_terms'] = true

# Apache 
default['apache']['admin_mail'] = "ebordeleau@myfastmail.com"
default['apache']['htmldocroot'] = "/var/www/html"
default['apache']['loglevel'] = 'debug'
default['apache']['dir'] = "/etc/apache2"
default['apache']['user'] = 'www-data'
default['apache']['group'] = 'www-data'
default['apache']['servername'] = "www"

# PHP parameters
default['php']['parameters']['file'] ="/etc/php5/cgi/php.ini"
default['php']['parameters']['max_upload_size'] ="upload_max_filesize"
default['php']['parameters']['mem_limit'] ="memory_limit"