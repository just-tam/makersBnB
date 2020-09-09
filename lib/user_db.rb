class User
  include Mongoid::Document

  field :username, type: String
  field :email, type: String
  field :password, type: String

end

def create_user
  User.create(username:'nomad3', email:'nomad3@email.com', password:'octopus12?')
end