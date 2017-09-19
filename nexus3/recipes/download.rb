#
# Cookbook:: nexus3
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

user 'nexus' do
  comment 'Nexus 3 user'
  system true
  shell '/bin/false'
  home node['nexus3']['install_dir']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus3']['install_dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  action :create
end

tar_extract "https://download.sonatype.com/nexus/3/nexus-#{node['nexus3']['version']}-unix.tar.gz" do
  target_dir node['nexus3']['install_dir']
  user 'nexus'
  group 'nexus'
end
