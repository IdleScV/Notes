MVC Architecture
    Models
        responsible for talking to the database
            In general, all logic should be shown in the models.
            It's best practice to do any manipulation into our models
    Views
        HTML markup of page. (CSS, HTML) presentation of code. 
            As little logic as possible.
            Should be only about presenting 
    Controllers
        Bridges the gap between Models and Views.
<!-- ! FROM LAB... -->
    Models: The 'logic' of a web application. This is where data is manipulated and/or saved.
    Views: The 'front-end', user-facing part of a web application - this is the only part of the app that the user interacts with directly. Views generally consist of HTML, CSS, and Javascript.
    Controllers: The go-between for models and views. The controller relays data from the browser to the application, and from the application to the browser.


EX. 
Browser makes request

website.com/user
    */users* =>  goes through a router/controller
                sends request to models (which send to database)
                information from models get sent to (controller, than to) the view, back to the controller
                which is then shown on the browser

GET request vs POST request
    GET - asking server for information
    POST - sending information

.erb = embedded ruby. Basically an HTML file that enables ruby code through <% %> or <%= %>


with Sinatra controllers, we  have to . . .
    set :views, "app/views"

REST
    REpresentational
    State
    Transfer
        The url itself should give us information on what we're looking for

<!-- ! byebug -->
This is the sinatra equivelant of pry



    ├── Gemfile
    ├── README.md
    ├── app
    │   ├── controllers
    │   │   └── application_controller.rb
    │   ├── models
    │   │   └── model.rb
    │   └── views
    │       └── index.erb
    ├── config
    │   └── environment.rb
    ├── config.ru
    ├── public
    │   └── stylesheets
    └── spec
        ├── controllers
        ├── features
        ├── models
        └── spec_helper.rb


Blackboxing . . . 
    knowing that an app works but not knowing exactly how it runs.

<!--//                                   -->
GET => POST = create new

<form action="/books" method="POST">
    <label for="title">Title</label>
        <input type="text" name="title">
    <label for="author">Author</label>
        <input type="author" name="author">
    <label for="snippet">snippet</label>
        <input type="text" name="snippet">
        <input type="submit">
</form>

get '/books/new'
    This should be written before
get '/books/:id' 


<!--//                                   -->
GET => PUT = update specific

<form action="/books/<%=@book.id%>/edit" method="POST"> _lpchecked="1"
    <input type="hidden" name="_method" value="PUT"> 
                <!--* _method (built in sinatra method) at the top of the controll, (set :method_override, true) -->
    <label for="title">Title</label>
        <input type="text" name="title" value="<%=@book.title%>" >
    <label for="author">Author</label>
        <input type="author" name="author" value="<%=@book.author%>">
    <label for="snippet">snippet</label>
        <input type="text" name="snippet" value="<%=@book.snippet%>">
        <input type="submit">
</form>
PUT replaces an entire resource
PATCH replaces only the changed value
<!--//                                   -->
DELETE
<form action="/books/<%=@book.id%>" value = "delete this book?">
    <input type="hidden" name="_method" value="DELETE">
    <input type="submit" value="Delete this book">
</form>