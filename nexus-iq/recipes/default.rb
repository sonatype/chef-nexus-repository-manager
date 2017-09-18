#
# Cookbook:: nexus-iq
# Recipe:: default
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'java'
include_recipe 'nexus-iq::download'
include_recipe 'nexus-iq::configure'
include_recipe 'nexus-iq::systemd'
