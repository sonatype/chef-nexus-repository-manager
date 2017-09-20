#
# Cookbook:: nexus3

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nexus3']['version'] = '3.5.2-01'
default['nexus3']['checksum'] = '10d387c4089c00d88388aefec12eef132d3c2d67'
default['nexus3']['install_dir'] = '/opt/sonatype'
