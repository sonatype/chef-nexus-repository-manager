#
# Cookbook:: nexus-iq-server

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nexus-iq-server']['version'] = '1.36.0-01'
default['nexus-iq-server']['checksum'] = 'a1a5d127e2deaf2b26ed4e605802986b99ea317c8a821059c918783517728d6c'
default['nexus-iq-server']['install_dir'] = '/opt/sonatype/nexus-iq-server'
default['nexus-iq-server']['logs_dir'] = '/var/log/nexus-iq-server'
default['nexus-iq-server']['conf_dir'] = '/etc/nexus-iq-server'

#
# default['nexus-iq-server']['config'] is used to generate config.yml. Parameter names and hierarchy must be the same as they
# are in config.yml.
#
default['nexus-iq-server']['config']['sonatypeWork'] = default['nexus-iq-server']['install_dir'] + '/sonatype-work/'
default['nexus-iq-server']['config']['http']['port'] = 8070
default['nexus-iq-server']['config']['http']['adminPort'] = 8071
default['nexus-iq-server']['config']['http']['requestLog']['console']['enabled'] = false
default['nexus-iq-server']['config']['http']['requestLog']['file']['enabled'] = true
default['nexus-iq-server']['config']['http']['requestLog']['file']['currentLogFilename'] = default['nexus-iq-server']['logs_dir'] + '/request.log'
default['nexus-iq-server']['config']['http']['requestLog']['file']['archivedLogFilenamePattern'] = default['nexus-iq-server']['logs_dir'] + "/request-\%d.log.gz"
default['nexus-iq-server']['config']['http']['requestLog']['file']['archivedFileCount'] = 50
default['nexus-iq-server']['config']['logging']['level'] = 'DEBUG'
default['nexus-iq-server']['config']['logging']['loggers']['com.sonatype.insight.scan'] = 'INFO'
default['nexus-iq-server']['config']['logging']['loggers']['eu.medsea.mimeutil.MimeUtil2'] = 'INFO'
default['nexus-iq-server']['config']['logging']['loggers']['org.apache.http'] = 'INFO'
default['nexus-iq-server']['config']['logging']['loggers']['org.apache.http.wire'] = 'ERROR'
default['nexus-iq-server']['config']['logging']['loggers']['org.eclipse.birt.report.engine.layout.pdf.font.FontConfigReader'] = 'WARN'
default['nexus-iq-server']['config']['logging']['loggers']['org.eclipse.jetty'] = 'INFO'
# WARNING: BasicHttpAuthenticationFilter reveals credentials at DEBUG level
default['nexus-iq-server']['config']['logging']['loggers']['org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter'] = 'INFO'
default['nexus-iq-server']['config']['logging']['console']['enabled'] = true
default['nexus-iq-server']['config']['logging']['console']['threshold'] = 'INFO'
default['nexus-iq-server']['config']['logging']['console']['logFormat'] = "\%d{'yyyy-MM-dd HH:mm:ss,SSSZ'} \%level [\%thread] \%X{username} \%logger \%msg\%n"
default['nexus-iq-server']['config']['logging']['file']['enabled'] = true
default['nexus-iq-server']['config']['logging']['file']['threshold'] = 'ALL'
default['nexus-iq-server']['config']['logging']['file']['currentLogFilename'] = default['nexus-iq-server']['logs_dir'] + '/clm-server.log'
default['nexus-iq-server']['config']['logging']['file']['archivedLogFilenamePattern'] = default['nexus-iq-server']['logs_dir'] + "/clm-server-\%d.log.gz"
default['nexus-iq-server']['config']['logging']['file']['archivedFileCount'] = 50
default['nexus-iq-server']['config']['logging']['file']['logFormat'] = "\%d{'yyyy-MM-dd HH:mm:ss,SSSZ'} \%level [\%thread] \%X{username} \%logger \%msg\%n"
