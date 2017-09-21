#
# Cookbook:: nexus3
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

start_script = node['nexus3']['nexus_home'] + '/start-nexus3.sh'

template start_script do
  source 'start-nexus3.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end