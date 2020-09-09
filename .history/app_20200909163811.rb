require 'sinatra/base'
require_relative './lib/space.rb'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/viewspaces' do
    @space = Space.all
  
    erb :spaces
  end

  post '/viewspaces/new' do
    Space.create(params[:name], params[:description], params[:price], params[:start_date], params[:end_date])
    redirect('/viewspaces')
  end


  run! if app_file == $0
end