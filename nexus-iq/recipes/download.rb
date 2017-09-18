#
# Cookbook:: nexus-iq
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

user 'nexus' do
  comment 'Nexus IQ user'
  system true
  shell '/bin/false'
  home node['nexus-iq']['install_dir']
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory node['nexus-iq']['install_dir'] do
  owner 'nexus'
  group 'nexus'
  mode '755'
  action :create
end

tar_extract "https://download.sonatype.com/clm/server/nexus-iq-server-#{node['nexus-iq']['version']}-bundle.tar.gz" do
  target_dir node['nexus-iq']['install_dir']
  user 'nexus'
  group 'nexus'
  checksum node['nexus-iq']['checksum']
  creates node['nexus-iq']['install_dir'] + '/config.yml'
end
