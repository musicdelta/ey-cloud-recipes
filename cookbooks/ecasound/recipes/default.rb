#
# Cookbook Name:: ecasound
# Recipe:: default
#

package 'media-sound/ecasound' do
  action :install
end

package 'media-sound/mpg321' do
  action :install
end

package 'media-sound/lame' do
  action :install
end