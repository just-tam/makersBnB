require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/viewspaces' do
    @spaces = [
        ":name => 'Team Nomad House'",
    ]
    erb :index
  end



  run! if app_file == $0
end