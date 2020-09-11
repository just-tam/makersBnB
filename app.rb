require 'sinatra/base'
require 'mongoid'
require './lib/user.rb'
require './lib/space.rb'
require 'json'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :"users_new"
  end

  get '/spaces' do
    @user = User.find_user(session[:user_id])
    session[:user_id]
    @viewusers = User.viewusers
    @space = Space.viewspaces
    erb :spaces
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_date: params[:available_date])
    redirect('/spaces')
  end


  get '/new' do
    erb :"users_new"
  end


  post '/spaces/:name' do
    Space.request(params[:name])
    erb :request
  end


  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/spaces')
  end

  run! if app_file == $0
end
