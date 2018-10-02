#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content "<h1>Hello, world!</h1>
  <h1>HOSTNAME: #{node['hostname']}</h1>
  <h1>IP ADDRESS: #{node['ipaddress']}</h1> 
  "
end

service 'httpd' do
  action [ :enable, :start ]
end
