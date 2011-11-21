#
# Cookbook Name:: ssh_tunnel
# Recipe:: server
#


remote_file '/tmp/id_rsa_tunnel.pub' do
  source 'id_rsa.pub'
end

bash 'authorize keys' do
  code <<-EOH
  cat /tmp/id_rsa_tunnel.pub >> /home/#{node[:owner_name]}/.ssh/authorized_keys
  rm /tmp/id_rsa_tunnel.pub
  EOH
end
