require_recipe "main"

gem_package 'bundler'

#execute "bundle gems" do
#  #user "vagrant"
#  cwd "/vagrant"
#  command "bundle install"
#  #returns 1
#  action :run
#end

execute "run unicorn" do
  user "vagrant"
  cwd "/vagrant"
  command "bundle install && bundle exec unicorn . -D -p 8080"
  not_if
  returns 1
  action :run
end