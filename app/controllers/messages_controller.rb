class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.find_all_by_to_id_and_bdeleted_to(session[:user_id],false)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> @messages }
    end
  end

  def index_sent
    @messages = Message.find_all_by_from_id_and_bdeleted_from(session[:user_id],false)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    if @message.to.id == session[:user_id]
     @message.update_attributes(:bread_to => true)
    end

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=> @message }
    end
  end

  def show_sent
    @message = Message.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=> @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @buf = params[:message]
    @buf[:to] = UsersController::User.find_by_name(@buf[:to])
    @buf[:from] = UsersController::User.find_by_name(session[:user_name])
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, :notice => 'Message was successfully created.' }
        format.json { render :json => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice => 'Message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete_from
     @message = Message.find(params[:id])
     if(@message[:bdeleted_to] == true)
       @message.destroy
       
        respond_to do |format|
            format.html { redirect_to sent_messages_url }
            format.json { head :ok }
        end
     else
       respond_to do |format|
        if @message.update_attributes(:bdeleted_from => true)
          format.html { redirect_to sent_messages_url, :notice => 'Message was successfully deleted.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @message.errors, :status => :unprocessable_entity }
        end
    end     
  end
  end

  def delete_to
     @message = Message.find(params[:id])
     if(@message[:bdeleted_from] == true)
       @message.destroy
       
        respond_to do |format|
            format.html { redirect_to messages_url }
            format.json { head :ok }
        end
     else
       respond_to do |format|
        if @message.update_attributes(:bdeleted_to => true)
          format.html { redirect_to :messages_url, :notice => 'Message was successfully deleted.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @message.errors, :status => :unprocessable_entity }
        end
    end     
  end
  end


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
end
