Setting up a Rails app. 
    Install Gem
        1. gem install rails
    
    Start a new project
        2. rails new blog-flash (blog-flash is the name of the app) lowercase- is standard naming convention
   
    CD into directory
        3. cd blog-flash
   
   Create new models 
        4. rails g(enerate) model [modelname] name:string age:number
            rails d(estroy) model [modelname] < to destroy models
                        [modelname] is not case sensitive 
    
    Create a new database
        1. rails db:create
    
    Start the rails app in a new server (run in main directory)
        1. rails s

    Runs on the browser at http://localhost:3000/ 

Using console 
    In terminal,to acces the rails irb
        1. rails c
    To exit
        2. exit 
        3. 
