# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

Depot::Application.configure do
    require 'tlsmail'
      Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
      ActionMailer::Base.delivery_method = :smtp
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.raise_delivery_errors = true
      ActionMailer::Base.smtp_settings = {
          :address => "smtp.gmail.com",
          :port => "587",
          :domain => "shmlx.info",
          :enable_starttls_auto => true,
          :authentication => :login,
          :user_name => "ruby@shmlx.info",
          :password => "ruby!!!!"
      }

    config.action_mailer.raise_delivery_errors = true
end
