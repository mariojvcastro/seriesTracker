Given /^there is a serie with the following info:$/ do |table|


  @serie = Series.create! table.rows_hash

end


Then /^this serie's information should be visible$/ do

  step %{I should see "#{@serie.name}"}
  step %{I should see "#{@serie.country}"}
  step %{I should see "#{@serie.start_date}"}
  step %{I should see "#{@serie.runtime}"}

end