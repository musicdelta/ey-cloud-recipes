default["openvpn"]["local"]   = node["ipaddress"]
default["openvpn"]["remote"]  = "vpn.musicdelta-service.com"
default["openvpn"]["port"]    = "5555"
default["openvpn"]["proto"]   = "udp"
default["openvpn"]["subnet"]  = "10.10.0.0"
default["openvpn"]["netmask"] = "255.255.255.0"
default["openvpn"]["log"]     = "/var/log/openvpn.log"
default["openvpn"]["key_dir"] = "/etc/openvpn/server/keys"
default["openvpn"]["signing_ca_key"]  = "#{node["openvpn"]["key_dir"]}/ca.key"
default["openvpn"]["signing_ca_cert"] = "#{node["openvpn"]["key_dir"]}/ca.crt"

# Used by helper library to generate certificates/keys
default["openvpn"]["key"]["ca_expire"] = 3650
default["openvpn"]["key"]["expire"]    = 3650
default["openvpn"]["key"]["size"]      = 1024
default["openvpn"]["key"]["country"]   = "US"
default["openvpn"]["key"]["province"]  = "CA"
default["openvpn"]["key"]["city"]      = "SanFrancisco"
default["openvpn"]["key"]["org"]       = "Fort-Funston"
default["openvpn"]["key"]["email"]     = "me@example.com"
