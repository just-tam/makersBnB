require 'sinatra/base'
require_relative './lib/space.rb'

class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/viewspaces' do
    @space = Space.all
  
    erb :spaces
  end



  run! if app_file == $0
end