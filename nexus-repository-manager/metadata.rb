#
# Cookbook:: nexus-repository-manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

name 'nexus-repository-manager'
maintainer 'Copyright (c) 2017-present Sonatype, Inc.'
license 'All Rights Reserved.'
description 'Installs/Configures Nexus Repository Manager'
long_description 'Installs/Configures Nexus Repository Manager'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/sonatype/nexus-chef-cookbook/issues'
source_url 'https://github.com/sonatype/nexus-chef-cookbook'

depends 'tar', '~> 2.1'
