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
  home node['nexus-repository-manager']['nexus']['home']['dir']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus-repository-manager']['sonatype']['dir'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['home']['dir'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

tar_extract node['nexus-repository-manager']['nexus_download_url'] do
  target_dir node['nexus-repository-manager']['nexus']['home']['dir']
  checksum node['nexus-repository-manager']['checksum']
  creates node['nexus-repository-manager']['nexus']['home']['bin']['dir']
  tar_flags [ '-P', '--strip-components 1' ]
end

directory node['nexus-repository-manager']['nexus']['home']['dir'] + '/nexus3' do
  recursive true
  action :delete
end

directory node['nexus-repository-manager']['nexus']['data']['dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['etc']['dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['log']['dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus']['data']['tmp']['dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['sonatype']['work']['dir'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

link node['nexus-repository-manager']['sonatype']['work']['nexus3']['dir'] do
  to node['nexus-repository-manager']['nexus']['data']['dir']
  owner 'root'
  group 'root'
end
