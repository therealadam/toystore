require 'pp'
require 'rubygems'
require 'toystore'
require 'adapter/cassandra'

require 'cassandra/0.7'

class Message
  include Toy::Store
  store :cassandra, Cassandra.new('Toystore'), :column_family => 'boom'

  attribute :title, String
  attribute :body, String
end

message = Message.create(:title => 'Power', :body => "No one man should have all the power")
pp message
pp Message.get(message.id)

message.destroy

pp Message.get(message.id)
