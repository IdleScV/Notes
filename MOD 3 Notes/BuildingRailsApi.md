Building an API-ONLY Rails.

1. in Terminal
    - rails new [name] --api
  
2. navigate into application
    - cd [name]

3. create all neccesary models 
    - rails g resource [model-1] [attribute-1] [attribute-2] [attribute-3]
    - rails g resource [model-2] [attribute-4] [attribute-5]
    - rails g resource [relationship-model] [model-1]:references [model-2]:refereces

4. seed data in seeds file

5. inside of the relationship-model controller. . .
   
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

        Since the resource generator was used, it would be good to be diligent and clean up config/routes.rb once we've decided what endpoints the API should have.

6. run 'rails server'
   


!. Dealing with CORS (Cross-Origin Resource Sharing) 

    1. uncomment gem 'rack-cors' (inside the Gemfile)
    2. run bundle install
    3. add the following to the 'config/application.rb' inside of the 'class Application < Rails::Application'
   
            config.middleware.insert_before 0, Rack::Cors do
                allow do
                    origins '*'
                    resource '*', headers: :any, methods: [:get, :post]
                end
            end
    ! This will allow you to test your APIs while developing them locally. Secretly, rack-cors has been bundled with the last set of lessons to ensure they were all working smoothly in case you decided to code along and spin up a rudimentary API.

    WARNING: Disabling CORS altogether in the long term can leave your server unsecure. Check out the documentation on CORS and rack-cors for additional information.
