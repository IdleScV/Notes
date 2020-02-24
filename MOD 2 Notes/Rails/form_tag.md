form_tag
  general, all-purpose, do whatever form

form_for
  form for a specific

  <!-- !!                        -->
      NEW
  <!-- !!                        -->
<!-- *inside of controller... -->

  def new
    @student = Student.new
  end

  def create
    Student.create(first_name: params[:student][:first_name], last_name:params[:student][:last_name] )
    redirect_to students_path
  end

<!--* in new.erb -->

  <h3>Student Form</h3>

    <%= form_for @student do |f| %>
    <%= f.label :first_name %>
    <%= f.text_field :first_name%>
    <%= f.label :last_name %>
    <%= f.text_field :last_name%>
    <%= f.submit "Submit Student"%>

  <%end%>
  


<!--*  #Forms with Strong Params -->

  def snack_params
    params.require(:student).permit(:first_name, last_name)
  end

This would change our controller method create to

  def create
    Student.create(snack_params)
    redirect_to students_path
  end

  <!-- !!                        -->
      UPDATE
  <!-- !!                        -->
<!-- *inside of controller... -->

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    @snack = snack.find(params[:id])
    @snack.update(snack_params)
    redirect_to snacks_path(@snack)
  end

<!--* in edit.erb -->

  <h3>Student Form</h3>

    <%= form_for @student do |f| %>
    <%= f.label :first_name %>
    <%= f.text_field :first_name%>
    <%= f.label :last_name %>
    <%= f.text_field :last_name%>
    <%= f.submit "Submit Student"%>

  <%end%>

  <!-- !!                        -->
      REPEAT FORM!? How to not. 
  <!-- !!                        -->
1. Create a file called _student_form.html.erb with this content
   
  <h3>Student Form</h3>
    <%= form_for @student do |f| %>
    <%= f.label :first_name %>
    <%= f.text_field :first_name%>
    <%= f.label :last_name %>
    <%= f.text_field :last_name%>
    <%= f.submit "Submit Student"%>
  <%end%>

2. Inside new.erb

  <h1> New Student </h1>
  <%= render 'student_form'%>

3. Inside edit.erb

  <h1> Edit Student </h1>
  <%= render 'student_form'%>


  <!-- !!                        -->
      DELETE
  <!-- !!                        -->
<!-- *inside of controller... -->

  def destroy
    @student =  Student.find(params[:id])
    @student.destroy
    redirect students_path
  end

<!-- *inside of show.erb... -->

  <%= form_tag(student_path(@student)), method: :delete do>
  <%= submit_tag "Delete Student">
  <%end%>