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


Additional rake commands...
rake db:create              # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:create:all to create all databases in...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV (use db:drop:all to drop all databases in the c...
rake db:environment:set     # Set the environment value for the database
rake db:fixtures:load       # Loads fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status      # Display status of migrations
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear  # Clears a db/schema_cache.yml file
rake db:schema:cache:dump   # Creates a db/schema_cache.yml file
rake db:schema:dump         # Creates a db/schema.rb file that is portable against any DB supported by Active Record
rake db:schema:load         # Loads a schema.rb file into the database
rake db:seed                # Loads the seed data from db/seeds.rb
rake db:setup               # Creates the database, loads the schema, and initializes with the seed data (use db:reset to also drop the database first)
rake db:structure:dump      # Dumps the database structure to db/structure.sql
rake db:structure:load      # Recreates the databases from the structure.sql file
rake db:version             # Retrieves the current schema version number