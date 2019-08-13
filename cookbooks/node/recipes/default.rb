#
# Cookbook:: node
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package "nginx"

service "nginx" do
  action [:enable, :start]
end
package "nodejs"
#include_recipe "nodejs-6.0.0"
template "/etc/nginx/sites-available/proxy.conf" do
  source "proxy.com.erb"
end
link "/etc/nginx/sites-enabled/proxy.conf" do
  to "/etc/nginx/sites-available/proxy.conf"
end
link "/etc/nginx/sites-enabled/default" do
  action :delete
  notifies :restart, 'service[nginx]'
end
node.default['nginx']['listen_ports'] = '3000'
