# require 'mongoid'

class Space

  attr_reader :name, :description, :price, :start_date, :end_date

  def initialize(name:, description:, price:, start_date:, end_date:)
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
  end

  def self.viewspaces
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
  Writes=true&w=majority")
    data  = client.database[:spaces]
    spaces = []
    data.find.each { |item| spaces << JSON.parse(item.to_json) }
    spaces.map { |space|
      Space.new(name: space["name"], description: space["description"], price: space["price"], start_date: space["start_date"], end_date: space["end_date"])
      }
  end

  def self.create(name:, description:, price:, start_date:, end_date:)
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
  Writes=true&w=majority")
    collection = client[:spaces]
    doc = {
      name: name,
      description: description,
      price: price,
      start_date: start_date,
      end_date: end_date,
    }
    collection.insert_one(doc)
  end

end
