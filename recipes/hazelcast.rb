#
# Cookbook:: nexus_repository_manager
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

hazelcast_xml = node['nexus_repository_manager']['nexus_home']['path'] + '/etc/fabric/hazelcast.xml'

directory node['nexus_repository_manager']['nexus_home']['path'] + '/etc/fabric/' do
  owner 'nexus'
  group 'nexus'
  mode '755'
  recursive true
  action :create
end

template hazelcast_xml do
  source 'hazelcast.xml.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
