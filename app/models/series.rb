class Series < ActiveRecord::Base
      has_many :seasons
      has_many :episodes, :through => :seasons
      has_many :favorites, :dependent => :destroy
      has_many :users, :through => :favorites
end
