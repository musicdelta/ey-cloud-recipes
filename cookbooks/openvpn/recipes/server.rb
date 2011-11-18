#
# Cookbook Name:: openvpn
# Recipe:: server
#
#
key_dir = node["openvpn"]["key_dir"]
key_size = node["openvpn"]["key"]["size"]

package "openvpn" do
  action :install
end

link "/etc/init.d/openvpn.server" do
  to "/etc/init.d/openvpn"
end

directory key_dir do
  owner "root"
  group "root"
  mode 0700
  recursive true
end

file "#{key_dir}/index.txt" do
  owner "root"
  group "root"
  mode 0600
  action :create
end

execute "setup #{key_dir}/serial" do
  command "echo '01' > #{key_dir}/serial"
  not_if { ::File.exists?("#{key_dir}/serial") }
end

['01.pem', '02.pem', 'serial', 'index.txt', 'index.txt.attr', 'ca.crt', 'ca.key', "dh#{node["openvpn"]["key"]["size"]}.pem", "ta.key", "server.crt", "server.csr", "server.key"].each do |file|
  remote_file "#{key_dir}/#{file}" do
    source file
    mode 0700
  end
end

service "openvpn.server" do
  action [:enable, :start]
end

template "/etc/openvpn/server.conf" do
  source "server.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "openvpn.server"), :immediate
end

