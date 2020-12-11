module ApplicationHelper
    include DealsHelper
    include HomeHelper
    include UserLibrariesHelper

    def is_admin?
        if current_user.is_admin? == true
            return true
        else
            redirect_to root_path unless current_user.is_admin?
            flash[:alert_admin] = "Non mais tu t'es pris pour un admin ?!"
        end
    end
    
    def is_completed?
        if current_user.completed == true
            return true
        else
            redirect_to root_path
            flash[:alert] = "Veuillez compléter votre profil pour accéder à cette fonctionnalité"
        end
    end

    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])
    @wrapper = Discogs::Wrapper.new('Discotroc')

end
