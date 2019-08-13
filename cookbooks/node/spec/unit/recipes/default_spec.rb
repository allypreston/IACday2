#
# Cookbook:: node
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should install nginx' do
      expect(chef_run).to install_package "nginx"
    end
    it 'should enable nginx' do
      expect(chef_run).to enable_service('nginx')
    end
    it 'should run nginx' do
      expect(chef_run).to start_service('nginx')
    end
    # it 'should install nodejs from a recipe' do
    #   expect(chef_run).to include_recipe('nodejs')
    # end
    it 'should install nodejs' do
      expect(chef_run).to install_package('nodejs')
    end
    it 'should create a proxy.conf template in /etc/nginx/sites-available' do
      expect(chef_run).to create_template('/etc/nginx/sites-available/proxy.conf')
    end
    it 'should create a symlink between sites-enabled and sites-available' do
      expect(chef_run).to create_link('/etc/nginx/sites-enabled/proxy.conf').with_link_type(:symbolic)
    end
    it 'should delete the symlink from the default config in sites-enabled' do
      expect(chef_run).to delete_link('/etc/nginx/sites-enabled/default')
    end
    it 'runs apt get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end
  end
end
#   context 'When all attributes are default, on CentOS 7' do
#     # for a complete list of available platforms and versions see:
#     # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
#     platform 'centos', '7'
#
#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#   end
