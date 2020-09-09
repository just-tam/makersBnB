require 'sinatra/base'
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


  run! if app_file == $0
end