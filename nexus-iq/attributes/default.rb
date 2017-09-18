#
# Cookbook:: nexus-iq

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nexus-iq']['version'] = '1.35.0-02'
default['nexus-iq']['checksum'] = '05eb24f885238c77dfa678bf199becf725e40c2ed08fc9235f6ce067e982ae5e'
default['nexus-iq']['install_dir'] = '/opt/nxiq'
default['nexus-iq']['logs_dir'] = '/var/log/nxiq'
default['nexus-iq']['conf_dir'] = '/etc/nxiq'

#
# default['nexus-iq']['config'] is used to generate config.yml. Parameter names and hierarchy must be the same as they
# are in config.yml.
#
default['nexus-iq']['config']['sonatypeWork'] = default['nexus-iq']['install_dir'] + '/sonatype-work/clm-server'
default['nexus-iq']['config']['http']['port'] = 8070
default['nexus-iq']['config']['http']['adminPort'] = 8071
default['nexus-iq']['config']['http']['requestLog']['console']['enabled'] = false
default['nexus-iq']['config']['http']['requestLog']['file']['enabled'] = true
default['nexus-iq']['config']['http']['requestLog']['file']['currentLogFilename'] = default['nexus-iq']['logs_dir'] + '/request.log'
default['nexus-iq']['config']['http']['requestLog']['file']['archivedLogFilenamePattern'] = default['nexus-iq']['logs_dir'] + "/request-\%d.log.gz"
default['nexus-iq']['config']['http']['requestLog']['file']['archivedFileCount'] = 50
default['nexus-iq']['config']['logging']['level'] = 'DEBUG'
default['nexus-iq']['config']['logging']['loggers']['com.sonatype.insight.scan'] = 'INFO'
default['nexus-iq']['config']['logging']['loggers']['eu.medsea.mimeutil.MimeUtil2'] = 'INFO'
default['nexus-iq']['config']['logging']['loggers']['org.apache.http'] = 'INFO'
default['nexus-iq']['config']['logging']['loggers']['org.apache.http.wire'] = 'ERROR'
default['nexus-iq']['config']['logging']['loggers']['org.eclipse.birt.report.engine.layout.pdf.font.FontConfigReader'] = 'WARN'
default['nexus-iq']['config']['logging']['loggers']['org.eclipse.jetty'] = 'INFO'
# WARNING: BasicHttpAuthenticationFilter reveals credentials at DEBUG level
default['nexus-iq']['config']['logging']['loggers']['org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter'] = 'INFO'
default['nexus-iq']['config']['logging']['console']['enabled'] = true
default['nexus-iq']['config']['logging']['console']['threshold'] = 'INFO'
default['nexus-iq']['config']['logging']['console']['logFormat'] = "\%d{'yyyy-MM-dd HH:mm:ss,SSSZ'} \%level [\%thread] \%X{username} \%logger \%msg\%n"
default['nexus-iq']['config']['logging']['file']['enabled'] = true
default['nexus-iq']['config']['logging']['file']['threshold'] = 'ALL'
default['nexus-iq']['config']['logging']['file']['currentLogFilename'] = default['nexus-iq']['logs_dir'] + '/clm-server.log'
default['nexus-iq']['config']['logging']['file']['archivedLogFilenamePattern'] = default['nexus-iq']['logs_dir'] + "/clm-server-\%d.log.gz"
default['nexus-iq']['config']['logging']['file']['archivedFileCount'] = 50
default['nexus-iq']['config']['logging']['file']['logFormat'] = "\%d{'yyyy-MM-dd HH:mm:ss,SSSZ'} \%level [\%thread] \%X{username} \%logger \%msg\%n"
