require 'sinatra/base'
require 'mongoid'
Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

class MakersBnb < Sinatra::Base
  get '/' do
    'MakersBnB!'
  end

  run! if app_file == $0
end