#
# Cookbook Name:: webserver
# Recipe:: mediawiki
# Author:: Eric Bordeleau (ebordeleau@myfastmail.com) 
#
# Copyright (c) 2014 All Rights Reserved.	

include_recipe "apache2::default"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_ajp"
include_recipe "apache2::mod_headers"
include_recipe "apache2::mod_php5"


# Disable default site
apache_site '000-default' do
  enable false
end

# Install jdk7 from Oracle
java_ark "jdk" do
    bin_cmds ["java", "javac", "keytool"]
    action :install
end

# Modifying PHP parameters 
ruby_block "Modify PHP parameters" do
  block do  
    fe = Chef::Util::FileEdit.new("#{node['php']['parameters']['file']}")
    fe.search_file_replace_line("#{node['php']['parameters']['max_upload_size']} = 2M","#{node['php']['parameters']['max_upload_size']} = 20M")  
    fe.search_file_replace_line("#{node['php']['parameters']['mem_limit']} = 8M","#{node['php']['parameters']['mem_limit']} = 128M")
    fe.write_file
  end
end


