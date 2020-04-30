#
# Cookbook Name:: freeipa
# Recipe:: default
#
# Copyright 2020, Bedrock.local
#
template '/etc/hostfile' do
  source 'etc/hostfile.erb'
  owner 'root'
  group 'root'
  mode  '0644'
  variables(
    ipaddress: node['freeipa']['ipaddress'],
    retries: node['freeipa']['retries'],
    retry_delay: node['freeipa']['retry_delay'],
    action: node['freeipa']['action'],
    ipa_admin_password: node['freeipa']['ipa_admin_password'],
    hostname: node['freeipa']['hostname'],
    domain: node['freeipa']['domain'],
    dir_manager_password: node['freeipa']['dir_manager_password'],
    realm_name: node['freeipa']['realm_name']
  )
end

execute 'module_install' do
  command 'yum -y install @idm:DL1'
end

pkgs = %w(
 freeipa-server
 ipa-server-dns
 bind-dyndb-ldap
 )

pkgs.each do |pkg|
  package(pkg) do
    action :install
  end
end

execute 'freeipa_install' do
  command 'ipa-server-install -U --no-host-dns -a adminpw9 --hostname=centos8.example.local -n example.local  -p drmanpw8  --master-password=masterpw -r EXAMPLE.LOCAL '
end

include_recipe 'freeipa::freeipa-server'
include_recipe 'freeipa::firewall'
include_recipe 'freeipa::bind-dyndb'
include_recipe 'freeipa::ipa-server-dns'