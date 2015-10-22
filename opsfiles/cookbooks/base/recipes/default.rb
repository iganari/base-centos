#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file "/develop" do
  owner  "vagrant"
  group  "vagrant"
  mede   "0777"
  action "create"
end
