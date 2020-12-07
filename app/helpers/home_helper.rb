module HomeHelper
    def search_sender_disc_home      
        last_libraries = UserLibrary.first(4) 


        return last_libraries
    end 
end
