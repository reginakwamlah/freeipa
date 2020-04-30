#
# Cookbook Name:: freeipa
# Recipe:: firewall
#
# Copyright:: 2020, IBM Cloud IAas Bedrock
service 'firewalld' do
  action [:enable, :start]
end

execute 'freeipa_firewall' do
  command 'firewall-cmd --add-service={http,https,dns,ntp,freeipa-ldap,freeipa-ldaps} --permanent && firewall-cmd --reload'
end
