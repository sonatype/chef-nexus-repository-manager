#
# Cookbook:: nexus_repository_manager
# Recipe:: docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'java'
include_recipe 'nexus_repository_manager::download'
include_recipe 'nexus_repository_manager::configure'

set_limit 'nexus' do
  type 'hard'
  item 'nofile'
  value 65536
  use_system true
end

set_limit 'nexus' do
  type 'soft'
  item 'nofile'
  value 65536
  use_system true
end
