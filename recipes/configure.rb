#
# Cookbook:: nexus_repository_manager
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

start_script = node['nexus_repository_manager']['sonatype']['path'] + '/start-nexus-repository-manager.sh'

template start_script do
  source 'start-nexus-repository-manager.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

hazelcast_xml = node['nexus_repository_manager']['nexus_home']['path'] + '/etc/fabric/hazelcast.xml'

template hazelcast_xml do
  source 'hazelcast.xml.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

nexus_properties = node['nexus_repository_manager']['nexus_home']['path'] + '/etc/nexus-default.properties'

template nexus_properties do
  source 'nexus.properties.erb'
  owner 'nexus'
  group 'nexus'
  mode '0755'
end
