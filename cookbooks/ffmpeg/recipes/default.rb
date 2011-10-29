#
# Cookbook Name:: ecasound
# Recipe:: default
#

#package 'media-sound/ecasound' do
#  action :install
#end
#
#package 'media-sound/mpg321' do
#  action :install
#end
#
#package 'media-sound/lame' do
#  action :install
#end


app_version = "ffmpeg-0.8.5"
file_to_fetch = "http://ffmpeg.org/releases/#{app_version}.tar.bz2"

package 'dev-lang/yasm' do
  action :install
end

execute "fetch #{file_to_fetch}" do
  cwd "/tmp"
  command "wget #{file_to_fetch}"
  not_if { FileTest.exists?("/tmp/#{app_version}.tar.bz2") }
end

execute "untar /tmp/#{app_version}.tar.bz2" do
  command "cd /tmp; tar jxf #{app_version}.tar.bz2"
  not_if { FileTest.directory?("/tmp/#{app_version}") }
end

execute "configure #{app_version}" do
  cwd "/tmp/#{app_version}"
  command "./configure --enable-shared --enable-gpl  --enable-version3 --enable-nonfree  --enable-hardcoded-tables --enable-libfaac --enable-libmp3lame --prefix=/usr; make install"
  not_if { FileTest.exists?("/usr/bin/ffmpeg") }
end


