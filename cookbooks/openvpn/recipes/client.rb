#
# Cookbook Name:: openvpn
# Recipe:: client
#
#
key_dir = node["openvpn"]["key_dir"]

package "openvpn" do
  action :install
end

link "/etc/init.d/openvpn.server-client" do
  to "/etc/init.d/openvpn"
end

directory "#{key_dir}/server" do
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

['ca.crt', "dh#{node["openvpn"]["key"]["size"]}.pem", "ta.key", "client.crt", "client.csr", "client.key"].each do |file|
  remote_file "#{key_dir}/server/#{file}" do
    source file
    mode 0700
  end
end

service "openvpn.server-client" do
  action [:enable]
end

template "/etc/openvpn/server-client.conf" do
  source "server-client.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :start, resources(:service => "openvpn.server-client"), :immediate
end

