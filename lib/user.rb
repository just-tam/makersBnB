class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
    # @email = email
    # @password = password
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
    users.map { |user|
      User.new(id: user["_id"]["$oid"], username: user["username"])
      }
    end
  end

  def self.find_user(id)
    users_data = User.viewusers
    users_data.each do |user| if(user.id == id )
      p user
      return user
    end
      #user_data.find( { "_id": ObjectId("#{id}") } )
      #User.new(id:["_id"]["$oid"], username:["username"])
  end

  # def self.find(username)
  #   return nil unless username
  #   users_data = User.viewusers
  #   user_data.find( { "username" => ("#{username}") } )
  # end

end
