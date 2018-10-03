#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create  
end

service 'httpd' do
  action [ :enable, :start ]
end

execute 'create a script' do
  user "root"
  command "
  mkdir -p /var/www/mysites/ /
  chown -R apache /var/www/mysites/
  "
  creates "/var/www/mysites/"
end
