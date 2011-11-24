class SearchController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    @search = Search.new
    @search.keywords = params[:keywords]

    #redirect_to series_index_path(@search.series)
    
    render :file  => "series/index", :locals => {:series => @search.series}
  end

  def destroy
  end

end
