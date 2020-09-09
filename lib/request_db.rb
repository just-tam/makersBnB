class Request
  include Mongoid::Document

  field :user_id, type: String
  field :space_id, type: String
  field :status, type: Boolean

  # def self.create_request
  #   Request.create(username:'nomad3', email:'nomad3@email.com', password:'octopus12?')
  # end

end