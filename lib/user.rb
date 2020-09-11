class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:, email:, password:)
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
      Writes=true&w=majority")
      collection = client[:users]
      doc = {
        username: username,
        email: email,
        password: password
      }
      result = collection.insert_one(doc)
      oid = JSON.parse(result.inserted_id.to_json)
      User.new(id: oid["$oid"], username: username)
  end

  def self.viewusers
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
    Writes=true&w=majority")
    data  = client.database[:users]
    users = []
    data.find.each { |item| users << JSON.parse(item.to_json) }
    users.map do |user|
      User.new(id: user["_id"]["$oid"], username: user["username"])
    end
  end

  def self.find_user(id)
    return nil unless id
    users_data = User.viewusers
    users_data.each do |user|
      return user if user.id == id
    end
  end

end
