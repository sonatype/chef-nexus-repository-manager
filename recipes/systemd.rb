#
# Cookbook:: nexus_repository_manager
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

systemd_unit 'nexus-repository-manager.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Nexus Repository Manager service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  ExecStart=#{ node['nexus_repository_manager']['sonatype']['path'] }/start-nexus-repository-manager.sh
  User=nexus
  Restart=on-failure
  StartLimitInterval=30min
  StartLimitBurst=2
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end
