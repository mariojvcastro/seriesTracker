# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
  



start_date = Date.new(2010, 1, 3)
end_date = Date.new(2010, 1, 3)

serie = Series.create(:name => "exemplo 1", :country => "US", :tvrage_id => 3, :start_date => "teste", :end_date => "teste", :status => "ended", :runtime => 60, :image_url => "cenas", :start_date = start_date, :end_date = end_date)



season = Season.create(:series_id => serie.id, :number => 1)

inair = Date.new(2010, 1, 3)
episode = Episode.create(:season_id => season.id, :title => "Joaninha assassina",:number => 1, :screen_cap => "ghsdpi.jpg", :inair => inair)

