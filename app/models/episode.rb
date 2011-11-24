class Episode < ActiveRecord::Base
  belongs_to :season
  #belongs_to :series, :through => :season
  
  #attr_accessor :title
end
