#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'openjdk'
default['java']['accept_license_agreement'] = true

# nexus configuration
default['nexus_repository_manager']['version'] = '3.14.0-04'
default['nexus_repository_manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus_repository_manager']['version']}-unix.tar.gz"
default['nexus_repository_manager']['nexus_download_sha256'] = 'ae8cc7891942d71cf12c11e1a98d70c1310e788ab44aa95c5d1e7671cc0187e2'
default['nexus_repository_manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus_repository_manager']['nexus_data']['path'] = '/nexus-data'
default['nexus_repository_manager']['license_s3_bucket'] = nil
default['nexus_repository_manager']['license_s3_path'] = nil

# nexus.properties configuration
default['nexus_repository_manager']['properties']['application_port'] = '8081'
default['nexus_repository_manager']['properties']['application_host'] = '0.0.0.0'
default['nexus_repository_manager']['properties']['context_path'] = '/'
default['nexus_repository_manager']['properties']['license_file'] = nil
