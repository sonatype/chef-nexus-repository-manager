#
# Cookbook:: nexus-repository-manager
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'java'
include_recipe 'nexus-repository-manager::download'
include_recipe 'nexus-repository-manager::configure'
include_recipe 'nexus-repository-manager::systemd'
