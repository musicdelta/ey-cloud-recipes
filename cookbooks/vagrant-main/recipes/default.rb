require_recipe "resque"

#uncomment to run the redis recipe

require_recipe "redis"

require_recipe "mongodb"

require_recipe "ecasound"

script "execute" do
  interpreter 'bash'
  code <<EOF
    source '/usr/local/rvm/scripts/rvm'
    rvm use 1.9.2
    cd '/vagrant'
    bundle install
    QUEUE=* bundle exec rake resque:work &
    bundle exec rails s -d -p 8080
EOF

end


#remote_file "/etc/monit.d/unicorn.monitrc" do
#  owner 'root'
#  group 'root'
#  mode 0644
#  source "monitrc.conf"
#  action :create
#end

#remote_file "/etc/init.d/unicorn" do
#  source "unicorn.init"
#  owner "root"
#  group "root"
#  mode 0755
#  backup false
#  action :create
#end
#
#execute "enable unicorn" do
#  command "rc-update add unicorn default"
#  action :run
#end
#
#execute "start unicorn" do
#  command "/etc/init.d/unicorn restart"
#  action :run
#  not_if "/etc/init.d/unicorn status"
#end


#execute "bundle gems" do
#  #user "vagrant"
#  cwd "/vagrant"
#  command "bundle install"
#  #returns 1
#  action :run
#end

#execute "run unicorn" do
#  user "vagrant"
#  cwd "/vagrant"
#  command "bundle install && bundle exec unicorn . -D -p 8080"
#  not_if
#  returns 1
#  action :run
#end
