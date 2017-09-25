#
# Cookbook:: nexus-repository-manager
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

include_recipe 'java'
include_recipe 'nexus-repository-manager::download'
include_recipe 'nexus-repository-manager::configure'
include_recipe 'nexus-repository-manager::systemd'
