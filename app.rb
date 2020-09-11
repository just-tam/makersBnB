require 'sinatra/base'
require 'mongoid'
require './lib/user.rb'
require './lib/space.rb'
require 'json'
require './lib/single_user.rb'
#Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces' do
    @user = User.find(session[:username])
    @viewusers = User.viewusers
    @viewuser = Single.viewuser 
    @space = Space.viewspaces
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    redirect('/spaces')
  end

  get '/users/new' do
    erb :"users_new"
  end

  post '/users' do
    
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    
    session[:user_id] = user.id
    redirect('/spaces')
  end


  # post '/posts' do
  #   post = Post.create!(params[:post])
  #   post.to_json
  # end
  #
  # get '/posts/:post_id' do |post_id|
  #   post = Post.find(post_id)
  #   post.attributes.merge(
  #     comments: post.comments,
  #   ).to_json
  # end
  #
  # get '/posts/:user_id' do |user_id|
  #   user = User.find(user_id)
  #   user.attributes.merge(
  #     spaces: user.spaces,
  #   ).to_json
  # end
  #
  # get '/users' do
  #   users = User.all.to_json
  #   json = JSON.parse(users)
  #   user_id = json[0]["_id"]["$oid"]
  #   username = json[0]["username"]
  #   email = json[0]["email"]
  #   password = json[0]["password"]
  #   return "User id: #{user_id} Username: #{username}  Email: #{email}  Password: #{password}"
  # end

  run! if app_file == $0
end
