require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do 
    "Server started with Shotgun"
  end

end