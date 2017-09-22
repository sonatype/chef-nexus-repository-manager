#
# Cookbook:: nexus-repository-manager
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

user 'nexus' do
  comment 'Nexus Repository Manager user'
  system true
  shell '/bin/false'
  home node['nexus-repository-manager']['nexus_home']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus-repository-manager']['sonatype_dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus_home'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

tar_extract "https://download.sonatype.com/nexus/3/nexus-#{node['nexus-repository-manager']['version']}-unix.tar.gz" do
  target_dir node['nexus-repository-manager']['nexus_home']
  checksum node['nexus-repository-manager']['checksum']
  creates node['nexus-repository-manager']['nexus_home_bin']
  tar_flags [ '-P', '--strip-components 1' ]
  user 'nexus'
  group 'nexus'
end

directory node['nexus-repository-manager']['nexus_data'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus_data_etc'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus_data_log'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['nexus_data_tmp'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus-repository-manager']['sonatype_work'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

link node['nexus-repository-manager']['sonatype_work_nexus3'] do
  to node['nexus-repository-manager']['nexus_data']
  owner 'nexus'
  group 'nexus'
end
