#
# Cookbook Name:: freeipa
# Recipe:: freeipa-server
#
# Copyright 2020, Bedrock.local
#
service 'freeipa-server' do
  action [ :enable, :start]
end
