#
# Cookbook Name:: webserver
# Recipe:: mediawiki
# Author:: Eric Bordeleau (ebordeleau@myfastmail.com) 
#
# Copyright (c) 2014 All Rights Reserved.	


# Get the remote_file from MediaWiki
remote_file "/tmp/#{node['mediawiki']['file']}-#{node['mediawiki']['full_version']}.tar.gz" do
  owner "#{node['apache2']['user']}"
  group "#{node['apache2']['group']}"
  mode "0755"
  source "#{node['mediawiki']['url_base']}#{node['mediawiki']['minor_version']}/#{node['mediawiki']['file']}-#{node['mediawiki']['full_version']}.tar.gz"
end

# Decompress 
execute "Decompress and untar file" do
	cwd  "#{node['mediawiki']['installdir']}"
	command "tar xvfz /tmp/#{node['mediawiki']['file']}-#{node['mediawiki']['full_version']}.tar.gz; mv #{node['mediawiki']['file']}-#{node['mediawiki']['full_version']} #{node['mediawiki']['dir']}"
end

# Create apache config
template "#{node['apache']['dir']}/sites-available/#{node['mediawiki']['vhostconfig']}" do
  source 'wiki.conf.erb'
  notifies :restart, 'service[apache2]'
end  
apache_site 'wiki' do
  enable true
  notifies :restart, 'service[apache2]'
end



