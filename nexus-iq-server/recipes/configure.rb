#
# Cookbook:: nexus-iq-server
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

config_path = node['nexus-iq-server']['conf_dir'] + '/config.yml'
start_script = node['nexus-iq-server']['install_dir'] + '/start-nexus-iq-server.sh'

directory node['nexus-iq-server']['conf_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

directory node['nexus-iq-server']['logs_dir'] do
  owner 'nexus'
  group 'nexus'
  mode '0755'
  action :create
  recursive true
end

directory node['nexus-iq-server']['config']['sonatypeWork'] do
  owner 'nexus'
  group 'nexus'
  mode '0755'
  action :create
  recursive true
end

template config_path do
  source 'config.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template start_script do
  source 'start-nexus-iq-server.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
