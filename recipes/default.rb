#
# Cookbook:: nexus_repository_manager
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'java'
include_recipe 'nexus_repository_manager::download'
include_recipe 'nexus_repository_manager::configure'
include_recipe 'nexus_repository_manager::systemd'
