#
# Cookbook:: nexus-iq
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

nxiq_jar = "/opt/nxiq/nexus-iq-server-#{node['nexus-iq']['version']}.jar"

systemd_unit 'nxiq.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=nexus-iq service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  WorkingDirectory=/opt/nxiq
  ExecStart=/usr/bin/java -jar #{nxiq_jar} server config.yml
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end

