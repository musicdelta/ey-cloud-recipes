ssh_tunnel :connect_port => '27017',
  :ssh     => { :port => 22, :hostname => 'service.musicdelta-demo.com' },
  :forward => { :host => 'localhost', 'port' => '27017' }
