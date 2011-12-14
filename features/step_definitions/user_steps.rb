Given /^there is a user "([^"]*)" with password "([^"]*)"$/ do |username, password|

  User.create! :name => username, :password => password, :password_confirmation => password, :email => 'a@a.com'
  
end

