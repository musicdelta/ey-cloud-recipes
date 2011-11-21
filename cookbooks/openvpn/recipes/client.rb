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

['ca.crt', "dh#{node["openvpn"]["key"]["size"]}.pem", "ta.key", "client.crt", "client.csr", "client.key"].each do |file|
  cookbook_file "#{key_dir}/server/#{file}" do
    source file
    mode 0700
  end
end

template "/etc/openvpn/server-client.conf" do
  source "server-client.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[openvpn.server-client]"
end

service "openvpn.server-client" do
  action [:enable, :start]
end
