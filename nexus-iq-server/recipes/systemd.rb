#
# Cookbook:: nexus-iq-server
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

systemd_unit 'nexus-iq-server.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Nexus IQ Server service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  WorkingDirectory=#{ node['nexus-iq-server']['install_dir'] }
  ExecStart=#{ node['nexus-iq-server']['install_dir'] }/start-nexus-iq-server.sh
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end
