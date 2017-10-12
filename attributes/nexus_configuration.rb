#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

# sonatype-work
default['nexus_repository_manager']['sonatype']['sonatype_work']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/sonatype-work'
default['nexus_repository_manager']['sonatype']['sonatype_work']['nexus3']['path'] = default['nexus_repository_manager']['sonatype']['sonatype_work']['path'] + '/nexus3'

# nexus home
default['nexus_repository_manager']['nexus']['home']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/nexus'
default['nexus_repository_manager']['nexus']['home']['bin']['path'] = default['nexus_repository_manager']['nexus']['home']['path'] + '/bin'

# nexus data
default['nexus_repository_manager']['nexus']['data']['etc']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/etc'
default['nexus_repository_manager']['nexus']['data']['log']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/log'
default['nexus_repository_manager']['nexus']['data']['tmp']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/tmp'
