
    #* What is bundler?
    #* What is a gem?
    #* How do gems work?
    #* What is require?
    #* Why do we use require_relative?

    #! require vs require_relative
    #? 'require' accepts an absolute file path, meaning a file location relative to the root directory. require will also accept shortened names, and checks if any matches are found in the directories located in your shell's PATH variable.
    #* require 'pry'

    #? 'require_relative' accepts a relative file path to the file we want to require. This means we're providing a file path that starts from the file in which the require_relative statement is called.
    #* require_relative '../lib/ruby_file.rb'




    #! It is important to note that both require and require_relative will not load local variables - only functions, modules, and classes.