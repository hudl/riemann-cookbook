# Cookbook Name:: riemann
# Recipe:: default
# The MIT License (MIT)
#
# Copyright (c) 2013 Ryan S. Brown <sb@ryansb.com>
# Copyright (c) 2013 Hudl <@Hudl>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

case node['platform_family']
when "rhel","fedora"
    include_recipe 'yum::epel'
    rpm = node[:riemann][:rpm_url].empty? ? "http://aphyr.com/riemann/riemann-#{node[:riemann][:version]}-1.noarch.rpm" : node[:riemann][:rpm_url]
    execute "Install riemann" do
        not_if {File.exists?("/usr/bin/riemann")}
        command "yum localinstall -y #{rpm}"
    end
end
