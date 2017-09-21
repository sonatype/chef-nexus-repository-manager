#
# Cookbook:: nexus3

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nexus3']['version'] = '3.5.2-01'
default['nexus3']['checksum'] = '10d387c4089c00d88388aefec12eef132d3c2d67'
default['nexus3']['sonatype_dir'] = '/opt/sonatype'
default['nexus3']['nexus_home'] = default['nexus3']['sonatype_dir'] + '/nexus'
default['nexus3']['nexus_data'] = '/nexus-data'
default['nexus3']['nexus_data_etc'] = default['nexus3']['nexus_data'] + '/etc'
default['nexus3']['nexus_data_log'] = default['nexus3']['nexus_data'] + '/log'
default['nexus3']['nexus_data_tmp'] = default['nexus3']['nexus_data'] + '/tmp'
default['nexus3']['nexus_context'] = ''
default['nexus3']['sonatype_work'] = default['nexus3']['sonatype_dir'] + '/sonatype-work'
default['nexus3']['sonatype_work_nexus3'] = default['nexus3']['sonatype_work'] + '/nexus3'
