module HomeHelper
    def search_sender_disc_home
        userlibrary = UserLibrary.all
        # userlibrary2 = UserLibrary.where(id: deal_content.pluck(:sender_library_id))
        disc = Disc.where(id: userlibrary.pluck(:disc_id))
        return disc.last(4)
    end 
end
