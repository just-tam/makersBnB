# require 'mongoid'

class Space

  attr_reader :name, :description, :price, :available_date, :available

  def initialize(name:, description:, price:, available_date:, available:)
    @name = name
    @description = description
    @price = price
    @available_date = available_date
    @available = available
  end

  def self.viewspaces
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
      Writes=true&w=majority")
    data  = client.database[:spaces]
    spaces = []
    data.find.each { |item| spaces << JSON.parse(item.to_json) }
    spaces.map { |space|
      Space.new(name: space["name"], description: space["description"], price: space["price"], available_date: space["available_date"], available: space["available"])
      }
  end

  def self.create(name:, description:, price:, available_date:)
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
      Writes=true&w=majority")
    collection = client[:spaces]
    doc = {
      name: name,
      description: description,
      price: price,
      available_date: available_date,
      available: true
    }
    collection.insert_one(doc)
  end

  def self.request(name)
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
      Writes=true&w=majority")
      collection = client[:spaces]
      collection.update_one(
        { name: name },
        { "$set": { 'available': false } }
      )
    end

end
