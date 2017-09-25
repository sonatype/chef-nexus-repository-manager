#
# Cookbook:: nexus-repository-manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

default['java']['version_major'] = '8'
default['java']['version_minor'] = '144'
default['java']['version_build'] = '01'
default['java']['download_hash'] = '090f390dda5b47b9b721c7dfaa008135'

default['nexus-repository-manager']['version'] = '3.5.2-01'
default['nexus-repository-manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus-repository-manager']['version']}-unix.tar.gz"
default['nexus-repository-manager']['checksum'] = '477969da1ea3a532247be628e5ca2b466c9653e88ba51d51a1609eacb0a45b4b'
default['nexus-repository-manager']['sonatype_dir'] = '/opt/sonatype'
default['nexus-repository-manager']['nexus_home'] = default['nexus-repository-manager']['sonatype_dir'] + '/nexus'
default['nexus-repository-manager']['nexus_home_bin'] = default['nexus-repository-manager']['nexus_home'] + '/bin'
default['nexus-repository-manager']['nexus_data'] = '/nexus-data'
default['nexus-repository-manager']['nexus_data_etc'] = default['nexus-repository-manager']['nexus_data'] + '/etc'
default['nexus-repository-manager']['nexus_data_log'] = default['nexus-repository-manager']['nexus_data'] + '/log'
default['nexus-repository-manager']['nexus_data_tmp'] = default['nexus-repository-manager']['nexus_data'] + '/tmp'
default['nexus-repository-manager']['nexus_context'] = ''
default['nexus-repository-manager']['sonatype_work'] = default['nexus-repository-manager']['sonatype_dir'] + '/sonatype-work'
default['nexus-repository-manager']['sonatype_work_nexus3'] = default['nexus-repository-manager']['sonatype_work'] + '/nexus3'
