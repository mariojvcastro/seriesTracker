class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  
  skip_before_filter :authorize, :only => [:index, :new, :show, :create, :edit, :insert_forgot_password, :forgot_password, :reset_password]
  
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to(:back, :notice => "Sem permissoes.")
    end

  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully created.") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      if @user.id == session[:user_id]
        session[:user_id] = nil
      end
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
 
   def insert_forgot_password
    respond_to do |format|
      format.html { render :action => "_form_forgot_password" }
    end
    
  end
  
  def forgot_password
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if (user) 
        user.reset_password_code_until = 1.day.from_now
        user.reset_password_code = Digest::SHA1.hexdigest( "#{user.email}#{Time.now.to_s.split(//).sort_by {rand}.join}" )
        user.save!
        UserMailer.forgot_password(user).deliver
        format.html { redirect_to(root_url, :notice => "Reset Password link emailed to #{user.email}.")}
        format.xml { head :ok }
      else
        format.html { redirect_to(root_url, :notice => "User not found with email : --.")}
        format.xml { head :ok }
      end 
    end
  end
  
   
  def reset_password
    user = User.find_by_reset_password_code(params[:id])
    current_user = user if user &&  user.reset_password_code_until  && Time.now < user.reset_password_code_until
    if(user != nil)
      session[:user_id] = user.id
      session[:user_name] = user.name
    end
    redirect_to ({ :controller => 'users', :action => "edit_password" , :id => user.reset_password_code })
   end
  
  def edit_password
    @user = User.find_by_reset_password_code(params[:id])
  end

end