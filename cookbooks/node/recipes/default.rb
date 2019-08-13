#
# Cookbook:: node
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package "nginx"

service "nginx" do
  action [:enable, :start]
end
package "nodejs"
#include_recipe "nodejs-6.0.0"
