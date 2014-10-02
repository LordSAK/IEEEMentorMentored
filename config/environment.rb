# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
IEEEMentorMentored::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'saghir.alam.khatri@outlook.com',
  :password => 'shoaib',
  :domain => 'live.com',
  :address => 'smtp.live.com',
  :port => 587,
  :authentication => :login,
  :charset => 'utf-8'
}
