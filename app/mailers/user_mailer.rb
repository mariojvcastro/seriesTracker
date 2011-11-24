class UserMailer < ActionMailer::Base
  default :from => 'no-reply@seriesTracker.com'

 def forgot_password(user) 
   @user = user
   @url = root_url+"reset_password/#{user.reset_password_code}"
   mail( :to => user.email, :subject => "Forgotten Password - Reset Password Link" )
 end
end