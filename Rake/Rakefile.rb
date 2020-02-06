#!  require_relative 'config/environment.rb'
#? This allows us to access the environment file
    #? Example environment.rb file...
        #* require "bundler/setup"      << installer for gems if there was a Gemfile
        #* Bundler.require              << installer for gems if there was a Gemfile
        #* require "sinatra/activerecord"<< allows use of ActiveRecord gem
        #* require "ostruct"            << not sure
        #* require "date"               << gives us acces 
        #* require_all 'app/models'     << This gives us access to models, which is required for ActiveRecord migrating

        #* ENV["SINATRA_ENV"] ||= 'development'
        #* ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)


#! require "sinatra/activerecord/rake" 
#? This allows us to use active record and other activerecord related rake methods

#* desc "start console" << Gives access to binding.pry immediately
#* task :console do
#*   Pry.start
#* end


