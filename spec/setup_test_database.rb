require 'mongoid'

p "Setting up test database..."

def setup_test_database
  client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
    Writes=true&w=majority")
    collection = client[:spaces]  
  collection.drop({})
end