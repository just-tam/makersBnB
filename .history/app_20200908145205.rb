require 'sinatra/base'
require 'mongoid'
Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

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

class MakersBnb < Sinatra::Base
  #get '/' do
  #  'MakersBnB!'
  #end
   
  get '/posts' do
    Post.all.to_json
  end
  
  post '/posts' do
    post = Post.create!(params[:post])
    post.to_json
  end
  
  get '/posts/:post_id' do |post_id|
    post = Post.find(post_id)
    post.attributes.merge(
      comments: post.comments,
    ).to_json
  end
  
  post '/posts/:post_id/comments' do |post_id|
    post = Post.find(post_id)
    comment = post.comments.create!(params[:comment])
    {}.to_json
  end
  run! if app_file == $0
end