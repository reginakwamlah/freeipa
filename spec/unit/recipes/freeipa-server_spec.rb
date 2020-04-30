#
# Cookbook:: freeipa
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
require 'spec_helper'
describe 'freeipa::freeipa-server.rb' do
  context 'syslinux installed and enabled' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '8').converge(described_recipe) }
    it 'freeipa-server is installed' do
      expect(chef_run).to install_package('freeipa-server')
    end
    it 'freeipa-server is enabled' do
      expect(chef_run).to enable_service('freeipa-server')
    end
    it 'freeipa-server is started' do
      expect(chef_run).to start_service('freeipa-server')
    end
  end
end
