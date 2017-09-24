#
# Cookbook:: nexus-repository-manager
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

tar_extract 'http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz' do
  headers ({ "Cookie" => "oraclelicense=accept-securebackup-cookie;" })
  target_dir '/opt'
  user 'root'
  group 'root'
end

link '/opt/java' do
  to '/opt/jdk1.8.0_144'
  owner 'root'
  group 'root'
end

