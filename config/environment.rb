# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'mail'

# Initialize the Rails application.
Rails.application.initialize!

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => 'app49224341@heroku.com',
    :password => 'pv7ztdpi9206',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
