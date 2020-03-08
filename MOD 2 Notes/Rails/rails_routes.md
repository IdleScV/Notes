
  Static route - A static route will render a view that does not change. Typically, you will not send parameters to it. Examples would be a site's about or contact pages.
  
  Dynamic route - Dynamic routes are pages that accept parameters and render different content based on those parameters. An example would be a blog's post page that contains a specific article.


1. Inside of our "config/routes.rb", we want to link our routes.

        Rails.application.routes.draw do

            get '/about', to: 'static#about'

        end

2. So when we go to our webpage, (localhost/3000/about),
   It goes to the "static_controller" file which looks like this. 

        class StaticController < ApplicationController

            def about
              render "about" (this line is not neccessary if our method name and file name are the same)
            end

        end
          

3. Looks for the "#about" method, and runs the file about.html.erb
       
        <h1>Hello from the about page</h1>
 
        
resources: model-name, only: [:new, :create]