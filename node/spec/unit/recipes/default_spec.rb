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
    it 'should install nodejs from a recipe' do
      expect(chef_run).to include_recipe('nodejs')
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
