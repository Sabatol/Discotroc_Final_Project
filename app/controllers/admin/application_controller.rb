# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :is_admin?

    def is_admin?
      if current_user.is_admin? == true
        return true
      else
        redirect_to root_path unless current_user.is_admin?
        flash[:alert_admin] = "Non mais tu t'es pris pour un admin ?!"
      end
    end
  end
end
