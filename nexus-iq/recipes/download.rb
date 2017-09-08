#
# Cookbook:: nexus-iq
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

user 'nexus' do
  comment 'Nexus IQ user'
  system true
  shell '/bin/false'
  home '/opt/nxiq'
  action :create
end

group 'nexus' do
  members 'nexus'
  action :create
end

directory '/opt/nxiq' do
  owner 'nexus'
  group 'nexus'
  mode '755'
  action :create
end

tar_extract "https://download.sonatype.com/clm/server/nexus-iq-server-#{node['nexus-iq']['version']}-bundle.tar.gz" do
  target_dir '/opt/nxiq'
  user 'nexus'
  group 'nexus'
  creates '/opt/nxiq/config.yml'
end
