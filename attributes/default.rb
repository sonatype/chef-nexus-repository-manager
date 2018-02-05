#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/server-jre-8u162-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = '6942684acb6001748a01fc090a18f52ebd8cbfcf7be27ec6131981906bfa8b53'
default['java']['oracle']['accept_oracle_download_terms'] = true

# nexus configuration
default['nexus_repository_manager']['version'] = '3.8.0-02'
default['nexus_repository_manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus_repository_manager']['version']}-unix.tar.gz"
default['nexus_repository_manager']['nexus_download_sha256'] = '949e2e5e99a685ebce6a63ba1ca0d56bc794068922a5279bca59d15bd3ae677c'
default['nexus_repository_manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus_repository_manager']['nexus_data']['path'] = '/nexus-data'
default['nexus_repository_manager']['license_s3_bucket'] = nil
default['nexus_repository_manager']['license_s3_path'] = nil

# nexus.properties configuration
default['nexus_repository_manager']['properties']['application_port'] = '8081'
default['nexus_repository_manager']['properties']['application_host'] = '0.0.0.0'
default['nexus_repository_manager']['properties']['context_path'] = '/'
default['nexus_repository_manager']['properties']['license_file'] = nil
