Given /^there is a user "([^"]*)" with password "([^"]*)"$/ do |username, password|

  User.create! :name => username, :password => password, :password_confirmation => password, :email => 'a@a.com'
  
end

Given /^a user logged with username "([^"]*)" and password "([^"]*)"$/ do |username, password|

  step %{there is a user "#{username}" with password "#{password}"}
  visit(path_to("the homepage"))
  fill_in "name", :with => username
  fill_in "password", :with =>  password
  click_button "Login"

  
end



Given /^I should see the weekdays$/ do
  
  step %{I should see "Monday"}
  step %{I should see "Tuesday"}
  step %{I should see "Wednesday"}
  step %{I should see "Thursday"}
  step %{I should see "Friday"}
  step %{I should see "Saturday"}
  step %{I should see "Sunday"}

end