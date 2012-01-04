Given /^an episode of "([^"]*)" was released today$/ do |serie|
  serie = Series.create! :name => serie
  serie.seasons.create! :number => 1
  serie.seasons.first.episodes.create! :number => 1, :title => "x", :inair => Date.today 
end