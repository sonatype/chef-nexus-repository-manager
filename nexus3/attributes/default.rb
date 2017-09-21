#
# Cookbook:: nexus3

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nexus3']['version'] = '3.5.2-01'
default['nexus3']['checksum'] = '477969da1ea3a532247be628e5ca2b466c9653e88ba51d51a1609eacb0a45b4b'
default['nexus3']['sonatype_dir'] = '/opt/sonatype'
default['nexus3']['nexus_home'] = default['nexus3']['sonatype_dir'] + '/nexus'
default['nexus3']['nexus_home_bin'] = default['nexus3']['nexus_home'] + '/bin'
default['nexus3']['nexus_data'] = '/nexus-data'
default['nexus3']['nexus_data_etc'] = default['nexus3']['nexus_data'] + '/etc'
default['nexus3']['nexus_data_log'] = default['nexus3']['nexus_data'] + '/log'
default['nexus3']['nexus_data_tmp'] = default['nexus3']['nexus_data'] + '/tmp'
default['nexus3']['nexus_context'] = ''
default['nexus3']['sonatype_work'] = default['nexus3']['sonatype_dir'] + '/sonatype-work'
default['nexus3']['sonatype_work_nexus3'] = default['nexus3']['sonatype_work'] + '/nexus3'
