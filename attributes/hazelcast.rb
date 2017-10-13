#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

# group configuration
default['nexus_repository_manager']['hazelcast']['group']['name'] = 'nexus'
default['nexus_repository_manager']['hazelcast']['group']['password'] = 'nexus123'

# multicast configuration
default['nexus_repository_manager']['hazelcast']['multicast']['enabled'] = true
default['nexus_repository_manager']['hazelcast']['multicast']['group'] = '224.2.2.3'
default['nexus_repository_manager']['hazelcast']['multicast']['port'] = 54327

# tcp-ip configuration
default['nexus_repository_manager']['hazelcast']['tcp_ip']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['tcp_ip']['interface'] = '127.0.0.1'
default['nexus_repository_manager']['hazelcast']['tcp_ip']['members'] = ['127.0.0.1']

# aws configuration
default['nexus_repository_manager']['hazelcast']['aws']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['aws']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['aws']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['aws']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['aws']['tag_value'] = 'nexus-repository-manager'

# hazelcast discovery configuration
default['nexus_repository_manager']['hazelcast']['discovery']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['discovery']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['discovery']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['discovery']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['discovery']['security_group_name'] = ''
default['nexus_repository_manager']['hazelcast']['discovery']['tag_value'] = 'nexus-repository-manager'
default['nexus_repository_manager']['hazelcast']['discovery']['hz_port'] = 5701
