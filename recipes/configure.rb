#
# Cookbook:: nexus_repository_manager
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

directory node['nexus_repository_manager']['sonatype']['path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

start_script = node['nexus_repository_manager']['sonatype']['path'] + '/start-nexus-repository-manager.sh'

template start_script do
  source 'start-nexus-repository-manager.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

directory node['nexus_repository_manager']['nexus_home']['path'] + '/etc/' do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

nexus_properties = node['nexus_repository_manager']['nexus_home']['path'] + '/etc/nexus-default.properties'

template nexus_properties do
  source 'nexus.properties.erb'
  owner 'nexus'
  group 'nexus'
  mode '0755'
end
