We save our stylesheet inside of app/assets/stylesheets

It would look like this in the erb file... 
    <%= stylesheet_link_tag 'home.css', media: 'all', 'data-turbolinks-track': 'reload' %>

https://www.youtube.com/watch?v=s5OoNmgXx2U

Examples. . . .
stylesheet_link_tag "style"
# => <link href="/assets/style.css" media="screen" rel="stylesheet" />

stylesheet_link_tag "style.css"
# => <link href="/assets/style.css" media="screen" rel="stylesheet" />

stylesheet_link_tag "http://www.example.com/style.css"
# => <link href="http://www.example.com/style.css" media="screen" rel="stylesheet" />

stylesheet_link_tag "style", media: "all"
# => <link href="/assets/style.css" media="all" rel="stylesheet" />

stylesheet_link_tag "style", media: "print"
# => <link href="/assets/style.css" media="print" rel="stylesheet" />

stylesheet_link_tag "random.styles", "/css/stylish"
# => <link href="/assets/random.styles" media="screen" rel="stylesheet" />
#    <link href="/css/stylish.css" media="screen" rel="stylesheet" />