class Season < ActiveRecord::Base
    belongs_to :series
    
    has_many :episodes
end
