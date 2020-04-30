#
# Cookbook:: freeipa
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
require 'spec_helper'
describe 'freeipa::ipa-server-dns.rb' do
  context 'ipa-server-dns installed and enabled' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '8').converge(described_recipe) }
    it 'ipa-server-dns is installed' do
      expect(chef_run).to install_package('ipa-server-dns')
    end
    it 'ipa-server-dns is enabled' do
      expect(chef_run).to enable_service('ipa-server-dns')
    end
    it 'ipa-server-dns is started' do
      expect(chef_run).to start_service('ipa-server-dns')
    end
  end
end
