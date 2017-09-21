#
# Cookbook:: nexus3
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

user 'nexus' do
  comment 'Nexus 3 user'
  system true
  shell '/bin/false'
  home node['nexus3']['nexus_home']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus3']['sonatype_dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus3']['nexus_home'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

tar_extract "https://download.sonatype.com/nexus/3/nexus-#{node['nexus3']['version']}-unix.tar.gz" do
  target_dir node['nexus3']['nexus_home']
  checksum node['nexus3']['checksum']
  creates node['nexus3']['nexus_home_bin']
  tar_flags [ '-P', '--strip-components 1' ]
  user 'nexus'
  group 'nexus'
end

directory node['nexus3']['nexus_data'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus3']['nexus_data_etc'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus3']['nexus_data_log'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus3']['nexus_data_tmp'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

directory node['nexus3']['sonatype_work'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

link node['nexus3']['sonatype_work_nexus3'] do
  to node['nexus3']['nexus_data']
  owner 'nexus'
  group 'nexus'
end
