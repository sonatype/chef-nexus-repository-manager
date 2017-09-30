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
