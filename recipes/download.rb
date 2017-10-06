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
  home node['nexus_repository_manager']['nexus']['home']['path']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus_repository_manager']['sonatype']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus']['home']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

tar_extract node['nexus_repository_manager']['nexus_download_url'] do
  target_dir node['nexus_repository_manager']['nexus']['home']['path']
  checksum node['nexus_repository_manager']['nexus_download_sha256']
  creates node['nexus_repository_manager']['nexus']['home']['bin']['path']
  tar_flags [ '-P', '--strip-components 1' ]
end

# Delete the nexus3 folder that is not used.
directory node['nexus_repository_manager']['nexus']['home']['path'] + '/nexus3' do
  recursive true
  action :delete
end

directory node['nexus_repository_manager']['nexus']['data']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus']['data']['etc']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus']['data']['log']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus']['data']['tmp']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['sonatype']['sonatype_work']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

link node['nexus_repository_manager']['sonatype']['sonatype_work']['nexus3']['path'] do
  to node['nexus_repository_manager']['nexus']['data']['path']
  owner 'root'
  group 'root'
end
