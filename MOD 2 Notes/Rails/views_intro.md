Views

In a Rails application, the view files should contain the least amount of logic of any of the files in the model-view-controller architecture. The role of the view is to simply render whatever it is sent from the database.

Rails supplies a built in ActionView helper methods that you can implement to efficiently code the views. For example, if you wanted to create a div for a set of blog posts that you want to iterate over, you can implement the following code:    
    
    <%= content_tag(:div, @post, class: "post-index-page") do %>
      <%= content_tag(:p, "#{@post.title}: #{@post.summary}") %>
    <% end %>

Which is translated to the following HTML markup:

    <div id="post_42" class="post post-index-page">
      <p>My Amazing Blog Post: With an incredible summary</p>
    </div>