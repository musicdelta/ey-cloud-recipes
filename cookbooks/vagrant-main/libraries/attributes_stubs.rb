require 'chef/node'
class Chef::Node
  alias old_la load_attributes
  def load_attributes
    @attribute = {
      :environment => {
      :name => 'delta_service'
    },
      :users => [ { :username => 'vagrant',
                    :password => 'vagrant' } ],
                    "mongo_version" => "1.8.1",
                    "kernel" => {
      "machine" => ""
    },
      "utility_instances" => []
    }

    old_la
  end
end
