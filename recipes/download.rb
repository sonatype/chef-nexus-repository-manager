#
# Cookbook:: nexus-repository-manager
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

user 'nexus' do
  uid '200'
  comment 'Nexus Repository Manager user'
  system true
  shell '/bin/false'
  home node['nexus-repository-manager']['nexus']['home']['path']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus-repository-manager']['sonatype']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['home']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

tar_extract node['nexus-repository-manager']['nexus_download_url'] do
  target_dir node['nexus-repository-manager']['nexus']['home']['path']
  checksum node['nexus-repository-manager']['checksum']
  creates node['nexus-repository-manager']['nexus']['home']['bin']['path']
  tar_flags [ '-P', '--strip-components 1' ]
end

# Delete the nexus3 folder that is not used.
directory node['nexus-repository-manager']['nexus']['home']['path'] + '/nexus3' do
  recursive true
  action :delete
end

directory node['nexus-repository-manager']['nexus']['data']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['etc']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['log']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['tmp']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['sonatype']['sonatype_work']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

link node['nexus-repository-manager']['sonatype']['sonatype_work']['nexus3']['path'] do
  to node['nexus-repository-manager']['nexus']['data']['path']
  owner 'root'
  group 'root'
end
