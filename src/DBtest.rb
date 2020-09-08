require 'sinatra'
require 'mongoid'

=begin
configure do
  Mongoid.configure do |config|
    config.sessions = { 
      default => {
        :hosts => ["localhost:27017"], :database => "makers_bnb"
      }
    }
  end
end

class Post
  include Mongoid::Document

  field :title, type: String
  field :body, type: String

  has_many :comments
end

class Comment
  include Mongoid::Document

  field :name, type: String
  field :message, type: String

  belongs_to :post
end
