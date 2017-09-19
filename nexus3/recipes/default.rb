#
# Cookbook:: nexus3
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

include_recipe 'java'
include_recipe 'nexus3::download'
include_recipe 'nexus3::configure'
include_recipe 'nexus3::systemd'
