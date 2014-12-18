#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
include_recipe "apache2::default"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_ajp"
include_recipe "apache2::mod_headers"

# disable default site
apache_site '000-default' do
  enable true
end

# install jdk7 from Oracle
java_ark "jdk" do
    bin_cmds ["java", "javac", "keytool"]
    action :install
end

# create apache config
#template "#{node['apache']['dir']}/sites-available/#{node['myface']['config']}" do
 # source 'apache2.conf.erb'
  #notifies :restart, 'service[apache2]'
#end

