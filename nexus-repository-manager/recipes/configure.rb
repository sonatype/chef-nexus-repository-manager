#
# Cookbook:: Nexus Repository Manager
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

start_script = node['start-nexus-repository-manager']['sonatype_dir'] + '/start-nexus-repository-manager.sh'

template start_script do
  source 'start-nexus-repository-manager.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end