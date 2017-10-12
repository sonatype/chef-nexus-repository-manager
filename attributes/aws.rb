#
# Cookbook:: nexus_repository_manager
# Recipe:: docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['nexus_repository_manager']['aws']['log_group'] = ""
default['nexus_repository_manager']['aws']['region'] = ""
default['nexus_repository_manager']['aws']['stack_name'] = ""

default['poise-python']['install_python2'] = false
default['poise-python']['install_python3'] = false

default['awslogs']['data'] = '/var/awslogs'
