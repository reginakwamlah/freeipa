#
# Cookbook:: freeipa
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
require 'spec_helper'
describe 'freeipa::default' do
  context 'included recipes' do
    it 'includes dhcp-server recipe' do
      expect(chef_run).to include_recipe('kickstart::dhcp-server')
    end
    it 'includes firewall recipe' do
      expect(chef_run).to include_recipe('kickstart::firewall')
    end
    it 'includes tftp recipe' do
      expect(chef_run).to include_recipe('kickstart::tftp')
    end
    it 'includes syslinux recipe' do
      expect(chef_run).to include_recipe('kickstart::syslinux')
    end
    it 'includes vsftpd recipe' do
      expect(chef_run).to include_recipe('kickstart::vsftpd')
    end
    it 'includes xinetd recipe' do
      expect(chef_run).to include_recipe('kickstart::xinetd')
    end
  end
  context 'When all attributes are default, on CentOS 8' do
    platform 'centos', '8'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
  context 'When all attributes are default, on CentOS 7' do
    platform 'centos', '7'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
