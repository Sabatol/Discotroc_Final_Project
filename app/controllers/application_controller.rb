class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  require 'discogs'

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :first_name,
        :last_name,
        :address,
        :additional_address,
        :email,
        :password,
        :current_password,
        :description,
        :zipcode,
        :city,
        :country
      )
    end
  end
end
