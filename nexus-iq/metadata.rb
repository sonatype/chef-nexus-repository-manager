#
# Cookbook:: nexus-iq
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

name 'nexus-iq'
maintainer 'Copyright (c) 2017-present Sonatype, Inc.'
license 'Apache License, Version 2.0'
description 'Installs/Configures Nexus IQ Server'
long_description 'Installs/Configures Nexus IQ Server'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/sonatype/nexus-chef-cookbook/issues'
source_url 'https://github.com/sonatype/nexus-chef-cookbook'

depends 'java', '~> 1.50'
depends 'tar', '~> 2.1'
