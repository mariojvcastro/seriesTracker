class FavoritesController < ApplicationController
   def create
    if session[:user_id] == nil
      redirect_to register_path, :notice => 'Por favor, faca login.'
    end
    @user = current_user
    @favorite = @user.favorites.build(:user_id => session[:user_id], :series_id => params[:series_id])
   
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to spot_path(:id => params[:series_id]), :notice => 'Adicionado aos favoritos' }
        format.json { render :nothing => true }
        format.js { }
      end
    else
      respond_to do |format|
              format.html { redirect_to :back, :notice => "Erro!" ,:alert => "Erro!" }
              format.json { response.status = 401
                      render :text => 'Erro!' }
      end
    end
  end

  def destroy
    @favorite = Favorite.find(:first, :conditions => ['user_id = ? AND series_id = ?', session[:user_id], params[:series_id]])
    @favorite.destroy
    respond_to do |format|
    format.html { redirect_to :back, :notice => "Removed" ,:alert => "Removed" }
    end
    #redirect_to current_user, :notice => 'Eliminado.'
  end
  
  def index
    @user = current_user
    respond_to do |format|
        format.html { }
        
      end
  end
end
