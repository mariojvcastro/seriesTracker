class Search < ActiveRecord::Base
  
  
  def series
    @series ||= find_series
  end
  
  private
  
  def find_series
    Series.find(:all, :conditions => keyword_conditions)
  end
  
  def keyword_conditions
    ["series.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end
  
end
