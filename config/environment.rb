# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SeriesTracker::Application.initialize!

require 'development_mail_interceptor'  

ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "seriestracker.mieic@gmail.com",
  :password             => "tracker88",
  :domain               => "gmail.com",
  :authentication       => :plain,
  :enable_starttls_auto => true,
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development? 
