#* Gems 

#? Example...

#! Where we get it from
source "https://rubygems.org"
#! List of gems
    #! specific version
gem "sinatra", "2.0.2"
    #! latest version
gem "hashie"
    #! Anything before 2.0
gem "octokit", "~> 2.0"
    #! Private git with ssh key
gem "awesome_print", :git => 'git@github.com:awesome-print/awesome_print.git'

    #! gems we want in speicifc groups... (test, developoment, deploy)
group :development do
  gem "pry"
end
group :test do 
    gem 'rspec'
end 

#* are primarily hosted by [RubyGems], a free service provided for the Ruby community. If you've gone through the manual setup for your local environment or are using the in-browser IDE, you should be able to write the following in your terminal and type:
#! gem install rspec
#* And see your terminal respond by indicating that RSpec has been installed. When we run this command, Ruby locates the gem, looking in RubyGems by default, and if found, downloads and installs the latest version to your computer.

#* Gems can be found through google, or 
#? https://rubygems.org/
#* So, for instance, let's imagine we are looking for a gem to improve how Ruby prints data to the terminal. We could google something like ruby gem print output. Another option is to go to https://rubygems.org/search/advanced and enter print in the search bar.


#* Once we find a gem we like, for example... 
#? https://rubygems.org/gems/awesome_print
#* We can type in .... to our terminal
#! gem install awesome_print
#* Read the readme.md for instructions on how to use the gem.


#//                 
#* Gem Bundles...

#* When it comes to building applications that others will use, if a Ruby application relies on a gem, anyone using that app will need to install the gem to get the application to function correctly. To make this process easy, we use a...
#? Gemfile

#* A Gemfile lists all the gem dependencies for your application as well as the source where they can be downloaded, allowing other users to quickly install all the gems at once. We do this using...
#? Bundler
#*, typing 
#! bundle install 
#* in the terminal while in a Ruby application directory. Bundler will install any gems listed.


#* Gem file example...
#* A typical Gemfile has two parts - a source at the top and a list of gems. A minimal Gemfile could look like the following:

    source "https://rubygems.org", 
        #* By default Bundler will try to find gems at the default source that you specified in the top of your Gemfile. 
        #* But sometimes you might be working with a gem whose developer(s) haven't yet pushed the code to RubyGems.org. Maybe you're one of those developers yourself! In that case, Bundler provides a few options.
        #* via repository

            gem 'rack', git: 'https://github.com/rack/rack'
    
        #* Or if the gem is private and needs an SSH

            gem 'nokogiri', :git => 'login@example.com:some-user-account/some-private-gem.git'
     
    gem 'awesome_print'

#* listing gem versions...

    gem 'awesome_print', '~> 1.8'
    #? ~> before the version number will limit your app to using either the version you list or a version with only minor updates (or patches, depending on your syntax).
    gem 'awesome_print', '1.8'
    #? This makes it have to select a speicific version.

#* this application should use version 1.8 or the latest minor version up to 1.x, but not 2.0.


#* Gemfile with group specified

    source "https://rubygems.org"
        
    gem "sinatra"
    
    group :development do
    gem "pry"
    end

#* The group syntax uses the keyword group, followed by the app environment as a symbol (:development, :test, and :production are the standard environments), followed by the keyword do. Inside the block, we list all the gems specific to that group.
#* In the example above, we grouped pry in the development environment. This means that pry isn't accessible in testing or in production. There are a lot of gems specific to the testing environment, like rspec and capybara. You don't need to run tests in the development or production environments, so you don't need those gems loaded there. Groups allow us to specify which environment needs our gems.

#*Another way to write this..

    gem "pry", group: :development

    gem "pry", :group => :development
        #* If we want it in mulitple environments
    gem "pry", :groups => [:development, :test]
#***