require 'pp'
require 'rubygems'
require 'toystore'
require 'adapter/cassandra'

require 'cassandra/0.7'

# You'll need Cassandra 0.7 to run this example. Run the following in
# cassandra-cli to get everything in place:
#
# create keyspace Toystore;
# use Toystore;
# create column family Boom;

class Message
  include Toy::Store
  store :cassandra, Cassandra.new('Toystore'), :column_family => :Boom

  attribute :title, String
  attribute :body, String
end

message = Message.create(:title => 'Power', :body => "No one man should have all the power")
pp message
pp Message.get(message.id)

message.destroy

pp Message.get(message.id)
