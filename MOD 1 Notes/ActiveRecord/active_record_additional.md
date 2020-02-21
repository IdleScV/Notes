<!--! Joint tables-->

Class Tweet 
        :id <!--* Auto Added-->
        :user_id <!--* Relationship connector-->
        :content

Class Drinks have many Users
        :id <!--* Auto Added-->
        :name

Class Users have many Drinks, has many tweets
        :id <!--* Auto Added-->
        :user_name

Class Favorites
        :id <!--* Auto Added-->
        :user_id <!--* Relationship connector-->
        :drink_id <!--* Relationship connector-->


<!--! Setting up an ActiveRecord Database & ruby app -->
HOW TO USE ACTIVE RECORD IN YOUR RUBY PROJECT : https://www.techcareerbooster.com/blog/use-activerecord-in-your-ruby-project
Require files.... then, in our db directory,

    touch twitter.db (in terminal)

inside our environment.rb,

    ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: db/twitter.db
    ),

Then we create a migration file either manually or through

    rake db:create_migration NAME=create_users-table

on Migration files... https://guides.rubyonrails.org/active_record_migrations.html

*! If we want to reset our db
rake db:drop
rake db:create
rake db:migrate
*! If there is data to be seeded
rake db:seed