class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    @date = Date.today.beginning_of_week
    @today = Date.today
    @series_mon = Episode.find_all_by_inair(@date)
    @series_tues = Episode.find_all_by_inair(@date+1)
    @series_wed = Episode.find_all_by_inair(@date+2)
    @series_thr = Episode.find_all_by_inair(@date+3)
    @series_fri = Episode.find_all_by_inair(@date+4)
    @series_sat = Episode.find_all_by_inair(@date+5)
    @series_sun = Episode.find_all_by_inair(@date+6)    
  end
end
