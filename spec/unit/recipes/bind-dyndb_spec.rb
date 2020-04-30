#
# Cookbook:: freeipa
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
require 'spec_helper'
describe 'freeipa::bind-dyndb.rb' do
  context 'bind-dyndb installed and enabled' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '8').converge(described_recipe) }
    it 'bind-dyndb is installed' do
      expect(chef_run).to install_package('bind-dyndb')
    end
    it 'bind-dyndb is enabled' do
      expect(chef_run).to enable_service('bind-dyndb')
    end
    it 'bind-dyndb is started' do
      expect(chef_run).to start_service('bind-dyndb')  
    end
  end
end
