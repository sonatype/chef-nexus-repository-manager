#
# Cookbook:: nexus-iq-server
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

name 'nexus-iq-server'
maintainer 'Copyright (c) 2017-present Sonatype, Inc.'
maintainer_email 'cloud-ops@sonatype.com'
license 'Apache-2.0'
description 'Installs/Configures Nexus IQ Server'
long_description 'Installs/Configures Nexus IQ Server'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/sonatype/chef-nexus/issues'
source_url 'https://github.com/sonatype/chef-nexus'
supports 'ubuntu', '>= 16.04'
supports 'centos', '>= 7.3'

recipe 'nexus-iq-server::default', 'Installs Nexus IQ Server and starts it as systemd service.'
recipe 'nexus-iq-server::docker', 'Installs Nexus IQ Server. Instead of a systemd service start-nexus-iq-server.sh is provided in install_dir.'

depends 'java', '~> 1.50'
depends 'tar', '~> 2.1'
