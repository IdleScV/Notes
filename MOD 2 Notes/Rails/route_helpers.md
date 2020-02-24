https://learn.co/tracks/web-development-immersive-2-0-module-two/rails/intro-to-actionview/rails-url-helpers

Router helpers look like this .

    post_path(@post)

compared to a hard coded path like this 

    "/posts/#{@post.id}"

It's more natural to be able to pass arguments into a method as opposed to using string interpolation. For example, post_path(post, opt_in: true) is more readable than "posts/<%= post.id %>?opt_in=true"

Route helpers translate directly into HTML-friendly paths. In other words, if you have any weird characters in your URLs, the route helpers will convert them so they can be read properly by browsers. This includes items such as spaces or characters such as &, %, etc.


Example of a post request

    resources :posts, only: [:index, :show]

This translates to 

    posts   GET  /posts(.:format)       posts#index
    post    GET  /posts/:id(.:format)   posts#show

^ These above columns represent .... 
These four columns tell us everything that we'll need to use the route helper methods. The breakdown is below:

    Column 1 - This column gives the prefix for the route helper methods. In the current application, posts and post are the prefixes for the methods that you can use throughout your applications. The two most popular method types are _path and _url. So if we want to render a link to our posts' index page, the method would be posts_path or posts_url. The difference between _path and _url is that _path gives the relative path and _url renders the full URL. If you open up the rails console, by running rails console, you can test these route helpers out. Run app.posts_path and see what the output is. You can also run app.posts_url and see how it prints out the full path instead of the relative path. In general, it's best to use the _path version so that nothing breaks if your server domain changes

    Column 2 - This is the HTTP verb

    Column 3 - This column shows what the path for the route will be and what parameters need to be passed to the route. As you may notice, the second row for the show route calls for an ID. When you pass the :show argument to the resources method, it will automatically create this route and assume that you will need to pass the id into the URL string. Whenever you have id parameters listed in the path like this, you will need to pass the route helper method an ID, so an example of what our show route code would look like is post_path(@post). Notice how this is different than the index route of posts_path. Also, you can ignore the (.:format) text for now. If you open up the Rails console again, you can call the route helpers. If you have a Post with an id of 3, you can run app.post_path(3) and see what the resulting output is. Running route helpers in the rails console is a great way of testing out routes to see what their exact output will be

    Column 4 - This column shows the controller and action with a syntax of controller#action


Example usage...

        <% @posts.each do |post| %>
        <div><%= link_to post.title, post_path(post) %></div>
        <% end %>
            post.title << What i want it to say
            post_path(post) <<where i want it to go
                        <%= link_to("What we want it to say", "where i want it to go")%>

    Translates to

        <% @posts.each do |post| %>
        <div><a href='<%= "/posts/#{post.id}" %>'><%= post.title %></a></div>
        <% end %>


    commandline 
    rails routes => returns a list of routes available
    rails routes | grep snacks => search only where snacks is part of the route 

    app.snacks_path => returns => "/snacks"
    app.snacks_url => returns => "https://localhost:3000"

In routes, we can do this . . .  .
    get "/", to: "snacks$home", as "homepage"               << homepage is the prefix >>
To call it inside of an erb, we do 
    <%= link_to "HomePage", homepage_path %>


To add parameters . . . 
    get "/snacks/:id", to: "snacks$show", as "snack"
To call this . . .
    <%@snacks.each do |snack| %>
        <%= link_to snack.name, snack_path(snack)%>
    <%end%>


resources :snacks

resources :snacks only: [:index, :show]









    Byebug is pry!!!
     Byebug is pry!!!
      Byebug is pry!!!
       Byebug is pry!!!
        Byebug is pry!!!
         Byebug is pry!!!
          Byebug is pry!!!
           Byebug is pry!!!
            Byebug is pry!!!
             Byebug is pry!!! 
              Byebug is pry!!!
               Byebug is pry!!!
                Byebug is pry!!!
                 Byebug is pry!!!
                  Byebug is pry!!!
                   Byebug is pry!!!
                    Byebug is pry!!!
                     Byebug is pry!!!
                      Byebug is pry!!!
                       Byebug is pry!!!
                       