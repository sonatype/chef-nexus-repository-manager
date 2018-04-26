#
# Cookbook:: nexus_repository_manager
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

user 'nexus' do
  uid '200'
  comment 'Nexus Repository Manager user'
  system true
  shell '/bin/false'
  home node['nexus_repository_manager']['nexus_home']['path']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end
