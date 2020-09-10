class Space
  #include Mongoid::Document

  #field :name, type: String
  #field :description, type: String
  #field :price, type: Integer
  #field :start_date, type: String
  #field :end_date, type: String

  #belongs_to :user

  attr_reader :name, :description, :price, :start_date, :end_date

  def initialize(name: ,description:,price:, start_date:, end_date:)
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

  # def self.create_space
  #   Space.create(username:'nomad3', email:'nomad3@email.com', password:'octopus12?')
  # end

end
