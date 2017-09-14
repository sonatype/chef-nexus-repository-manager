#
# Cookbook:: nexus-iq
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

include_recipe 'java'
include_recipe 'nexus-iq::download'
include_recipe 'nexus-iq::configure'
include_recipe 'nexus-iq::systemd'
