openvpn :local => "0.0.0.0", :remote => "service.musicdelta-demo.com", :port => "5555", :proto => "udp",
        :subnet => "10.10.0.0", :netmask => "255.255.255.0", :log => "/var/log/openvpn.log",
        :key_dir => "/etc/openvpn/server/keys", :signing_ca_key => "/etc/openvpn/server/keys/ca.key",
        :signing_ca_cert => "/etc/openvpn/server/keys/ca.crt",
        :key => {:ca_expire => 3650, :expire => 3650, :size => 1024, :country => "US", :province => " CA ",
                 :city => "SanFrancisco", :org => " Fort-Funston ", :email => "me@example.com"}
