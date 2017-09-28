#
# Cookbook:: nexus-iq-server
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'java'
include_recipe 'nexus-repository-manager::download'
include_recipe 'nexus-repository-manager::configure'

set_limit 'nexus' do
  type 'hard'
  item 'nofile'
  value 2048
  use_system true
end

set_limit 'nexus' do
  type 'soft'
  item 'nofile'
  value 2048
  use_system true
end
