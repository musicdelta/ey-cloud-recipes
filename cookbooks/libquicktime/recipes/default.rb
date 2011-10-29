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


app_version = "libquicktime-1.2.3"
file_to_fetch = "http://downloads.sourceforge.net/project/libquicktime/libquicktime/1.2.3/#{app_version}.tar.gz"

execute "fetch #{file_to_fetch}" do
  cwd "/tmp"
  command "wget #{file_to_fetch}"
  not_if { FileTest.exists?("/tmp/#{app_version}.tar.gz") }
end

execute "untar /tmp/#{app_version}.tar.gz" do
  command "cd /tmp; tar zxf #{app_version}.tar.gz"
  not_if { FileTest.directory?("/tmp/#{app_version}") }
end

execute "configure #{app_version}" do
  cwd "/tmp/#{app_version}"
  command "./configure  --disable-debug --disable-dependency-tracking --enable-gpl --without-doxygen --prefix=/usr; make; make install"
  not_if { FileTest.exists?("/usr/lib/libquicktime.so") }
end


