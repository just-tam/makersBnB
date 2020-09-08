require 'sinatra/base'
require 'mongoid'

class MakersBnb < Sinatra::Base
  get '/' do
    'MakersBnB!'
  end

  run! if app_file == $0
end