#
# Cookbook:: nexus-repository-manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

name 'nexus-repository-manager'
maintainer 'Copyright (c) 2017-present Sonatype, Inc.'
maintainer_email 'cloud-ops@sonatype.com'
license 'Apache-2.0'
description 'Installs/Configures Nexus Repository Manager'
long_description 'Installs/Configures Nexus Repository Manager'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/sonatype/nexus-chef-cookbook/issues'
source_url 'https://github.com/sonatype/nexus-chef-cookbook'

depends 'java', '~> 1.50'
depends 'tar', '~> 2.1'
