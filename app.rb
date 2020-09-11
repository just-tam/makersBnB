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
    @user = User.find_user(session[:user_id])
    @viewusers = User.viewusers
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

  run! if app_file == $0
end
