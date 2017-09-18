#
# Cookbook:: nexus-iq
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

systemd_unit 'nxiq.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=nexus-iq service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  WorkingDirectory=#{ node['nexus-iq']['install_dir'] }
  ExecStart=#{ node['nexus-iq']['install_dir'] }/start-nexus-iq.sh
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end
