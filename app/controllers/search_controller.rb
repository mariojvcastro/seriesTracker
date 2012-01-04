class SearchController < ApplicationController
  require 'will_paginate/array' 
  skip_before_filter :authorize
  
  def new
    
    #@search = Search.find(params[:id])
    
    @search = Search.new
    @search.keywords = params[:keywords]
    @series = @search.series.paginate({:page => params[:page], :per_page => 30})
    #redirect_to series_index_path(@search.series)
    
    render :file  => "series/index", :locals => {:series => @series, :keywords => @search.keywords}
  end

  def create
    @search = Search.new
    @search.keywords = params[:keywords]
    #@search.save
    #session[:keywords] = params[:keywords]
    
    @series = @search.series.paginate({:page => params[:page], :per_page => 30})
    #redirect_to series_index_path(@search.series)
    
    render :file  => "series/index", :locals => {:series => @series, :keywords => @search.keywords}
  end

  def destroy
  end

end
