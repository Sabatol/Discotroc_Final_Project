# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Set the SMTP with SendGrid infos
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_LOGIN'],
  password: ENV['SENDGRID_PWD'],
  domain: 'http://localhost:3000/',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
