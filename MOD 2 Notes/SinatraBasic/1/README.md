# Sinatra From Scratch

## Overview

We'll cover the components of a basic Sinatra application and how to create a local host server to view the application in the browser.

## Objectives

1. Review gems and how to keep them updated using `bundle install`
2. Describe the purpose of the application controller and `app.rb` in Sinatra
3. Run a Sinatra app by entering `rackup app.rb` in your terminal

## Basic Sinatra App

### Sinatra Gem

This is not a lab, as there's nothing for you to submit. But to follow along with the lesson, make sure you fork and clone [this repository](https://github.com/learn-co-curriculum/sinatra-from-scratch-readme).

It's important to note that Sinatra is just a gem. It's a library of code that developers wrote to allow us to build light-weight web applications quickly. If you take a look at our `Gemfile` (a list of all the gems our application uses), you will see the Sinatra gem listed.

The first thing you need to do is enter in terminal `bundle install`. Just like software has different versions that require you to update your mobile apps, gems have newer versions. `bundle install` will lock in the current versions of the gems for your application. That way, if any updates happen, your app won't break. It keeps the versions locked in a file called `Gemfile.lock` that is created for you.

### `app.rb`

The `app.rb` file is the heart and soul of a Sinatra application. This is our application controller. The application controller handles all incoming requests to our app, and sends back the appropriate responses to the client.

The first line of `app.rb` is just requiring the Sinatra gem so that we can incorporate its functionality.

On the next line, we define a class `App` and have it inherit from `Sinatra::Base`. This way, any instance of our class App will have all the functionality of the Sinatra class.

Inside our class we have a Sinatra method define our controller action. This method responds to a `GET` request to the root url and displays the text `Hello, World!` in the browser.

### Starting The App

To actually check if our app is working in the browser, enter `rackup app.rb` in your terminal.

Sinatra relies on Rack for its middleware. Middleware is software that bridges the connection between our Ruby application and the database. Because we have the Sinatra gem listed in our Gemfile, we automatically have the Rack middleware setup.

Once your server is running, visit `localhost:9292` in the browser to see `Hello, World!` displayed.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/sinatra-from-scratch-readme' title='Sinatra From Scratch'>Sinatra From Scratch</a> on Learn.co and start learning to code for free.</p>

<p class='util--hide'>View <a href='https://learn.co/lessons/sinatra-from-scratch-readme'>Sinatra from Scratch</a> on Learn.co and start learning to code for free.</p>

# Sinatra Basics

## Overview

We'll discuss modular Sinatra applications and mounting a controller. 

## Objectives

1. Distinguish between single file Sinatra apps and modular Sinatra apps
2. Explain the purpose of the `config.ru` and what is included in the file
3. Define and create a Sinatra controller 
2. Mount a Sinatra controller in `config.ru`

## Modular Sinatra Applications

Web applications, even simple Sinatra ones, tend to require a certain degree of complexity. For example, your application might have multiple routes, route-handlers, and configuration. To handle this, Sinatra is more commonly used through the Modular Sinatra Pattern (over the classical, single file `app.rb` pattern).

### `config.ru`

The first new convention this pattern introduces is a `config.ru` file. The purpose of `config.ru` is to detail to Rack the environment requirements of the application and start the application.

A common 'config.ru' might look like:

File: `config.ru`
```ruby
require 'sinatra'

require_relative './app.rb'

run Application
```

In the first line of `config.ru` we load the Sinatra library. The second line requires our application file, defined in `app.rb`. The last line of the file uses `run` to start the application represented by the ruby class `Application`, which is defined in `app.rb`.

### Sinatra Controllers: `app.rb`

`config.ru` requires a valid Sinatra Controller to `run`. A Sinatra Controller is simply a Ruby `Class` that inherits from `Sinatra::Base`. This inheritance transforms our plain old Ruby class into a web application by giving it a Rack-compatible interface through inheriting from the "base" of the Sinatra framework. Open `app.rb`

```ruby
class Application < Sinatra::Base

  get '/' do
    "Hello, World!"
  end

end
```

We simply create a new class `Application` and inherit from `Sinatra::Base`. Our class constant could have been anything descriptive of the functionality provided by the class. The classes that inherit from `Sinatra::Base` and define the HTTP interface for our application are called Controllers.

In a single controller application, a single file defining the controller, like `app.rb`, will suffice. That controller will define every single URL and response of our application.

Controllers define an HTTP method using the sinatra routing DSL provided by methods like `get` and `post`. When you enclose these methods within a ruby class that is a Sinatra Controller, these HTTP routes are scoped and attached to the controller.

The final step in creating a controller is mounting it in `config.ru`. Mounting a controller means telling Rack that part of your web application is defined within the following class. We do this in config.ru by using `run Application` where `run` is the mounting method and `Application` is the controller class that inherits from `Sinatra::Base` and is defined in a previously required file.

The class name we defined in our application controller (`app.rb`) is just a normal Ruby class. We could have named it `MyToDoApp`:

```ruby
class MyToDoApp < Sinatra::Base

  get '/' do
    "Hello, World!"
  end

end
```

If this was our class name, we would need to change `config.ru` to run the appropriate class:

```ruby
run MyToDoApp
```

## Resources

* [Blake Mizerany - Ruby Learning Interview](http://rubylearning.com/blog/2009/08/11/blake-mizerany-how-do-i-learn-and-master-sinatra/)
* [Companies Using Sinatra](http://www.sinatrarb.com/wild.html)

<p class='util--hide'>View <a href='https://learn.co/lessons/sinatra-basics'>Sinatra Basics</a> on Learn.co and start learning to code for free.</p>
