#
# Cookbook Name:: freeipa
# Recipe:: bind-dyndb
#
# Copyright 2020, Bedrock.local
#
service 'bind-dyndb' do
  action [ :enable, :start]
end
