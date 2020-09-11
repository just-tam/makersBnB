class Single

  attr_reader :username

  def initialize(username:)
    @username = username
    # @email = email
    # @password = password
  end

  def self.viewuser
    client = Mongo::Client.new("mongodb+srv://Michael:nomads4life@cluster0.x9n0g.mongodb.net/makers_bnb?retr
      Writes=true&w=majority")
        data  = client.database[:users]
        users = []
        data.find.each { |item| users << JSON.parse(item.to_json) }
        users.map { |user|
          Single.new(username: user["username"])
          }
  end

end