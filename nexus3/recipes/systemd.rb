#
# Cookbook:: nexus3
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

systemd_unit 'nxrm.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=nexus3 service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  WorkingDirectory=#{ node['nexus3']['nexus_home'] }
  ExecStart=#{ node['nexus3']['nexus_home'] }/start-nexus3.sh
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end
