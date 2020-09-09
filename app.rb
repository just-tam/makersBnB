require 'sinatra/base'
<<<<<<< HEAD
require 'mongoid'
Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

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
=======
require_relative './lib/space.rb'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces' do
    @space = Space.all
  
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end
    
  post '/spaces' do
    p "I am hre"
    p params[:name]
    p params[:description]
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    redirect('/spaces')
  end


>>>>>>> viewing_spaces
  run! if app_file == $0
end