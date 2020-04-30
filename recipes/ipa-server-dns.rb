#
# Cookbook Name:: freeipa
# Recipe:: ipa-server-dns
#
# Copyright 2020, Bedrock.local
#
service 'ipa-server-dns' do
  action [ :enable, :start]
end
