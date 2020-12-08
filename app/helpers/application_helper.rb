module ApplicationHelper
    include DealsHelper
    include HomeHelper
    include UserLibrariesHelper

    def is_admin?
        if current_user.is_admin? == true
            return true
        else
            redirect_to root_path unless current_user.is_admin?
        end
    end

    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])
    @wrapper = Discogs::Wrapper.new('Discotroc')

end
