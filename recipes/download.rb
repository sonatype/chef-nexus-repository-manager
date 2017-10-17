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

directory node['nexus_repository_manager']['sonatype']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus_home']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

tar_extract node['nexus_repository_manager']['nexus_download_url'] do
  target_dir node['nexus_repository_manager']['nexus_home']['path']
  checksum node['nexus_repository_manager']['nexus_download_sha256']
  creates node['nexus_repository_manager']['nexus_home']['path'] + '/bin'
  tar_flags [ '-P', '--strip-components 1' ]
end

# Delete the nexus3 folder that is not used.
directory node['nexus_repository_manager']['nexus_home']['path'] + '/nexus3' do
  recursive true
  action :delete
end

directory node['nexus_repository_manager']['nexus_data']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus_data']['etc']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus_data']['log']['path'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['nexus_data']['path'] + '/tmp' do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus_repository_manager']['sonatype_work']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

link node['nexus_repository_manager']['sonatype_work']['path'] + '/nexus3' do
  to node['nexus_repository_manager']['nexus_data']['path']
  owner 'root'
  group 'root'
end

s3_file node['nexus_repository_manager']['nexus_data']['etc']['path'] + '/license.lic' do
  remote_path node['nexus_repository_manager']['license_s3_path']
  bucket node['nexus_repository_manager']['license_s3_bucket']
  owner 'nexus'
  group 'nexus'
  mode '600'
  action :create
  not_if { node['nexus_repository_manager']['license_s3_bucket'].to_s.empty? }
end
