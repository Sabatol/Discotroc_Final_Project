class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:password, :email, :first_name, :last_name, :address, :zipcode, :city, :country, :description)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :first_name,
        :last_name,
        :address,
        :email,
        :password,
        :current_password
      )
    end
  end


# lines in order to get access to Discogs API and do research directly on Discogs via our app. First it refers to the gem 'discogs-wrapper' then it sets the global variable '$wrapper' used throughout the app to get data from Discogs thanks to our user_token
require "discogs"
$wrapper = Discogs::Wrapper.new("Test OAuth", user_token: "UVWCcIcNhiFOYksyxJyWygbBQfqpIRfBILAtYGQV")

end
