class Series < ActiveRecord::Base
      has_many :seasons
      has_many :episodes, :through => :seasons
      
end
