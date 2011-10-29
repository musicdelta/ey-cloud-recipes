#require_recipe "resque"
#
##uncomment to run the redis recipe
#
#require_recipe "redis"
#
#require_recipe "mongodb"
#
#require_recipe "ecasound"

require_recipe "main"

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