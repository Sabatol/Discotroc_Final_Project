class UsersController < ApplicationController
  
    def index
        @users = User.all
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def edit
        @edit_user = User.find(params[:id])
    end 

    def update
        @edit_user = User.find(params[:id])
        post_params = params.require(:user).permit(:first_name, :last_name, :address, :additional_address, :city, :zipcode, :country, :description)
        @edit_user.update(post_params)
        if @edit_user.country && @edit_user.first_name && @edit_user.last_name && @edit_user.address && @edit_user.city && @edit_user.zipcode && @edit_user.description  
            @edit_user.update_attributes(completed: true)
            redirect_to user_path(@edit_user.id)
        else
            @edit_user.update_attributes(completed: false)
            redirect_to root_path
        end
    end 

    def destroy
        @destroy_user = User.find(params[:id])
        @destroy_user.destroy
        redirect_to users_path     
    end


    private
    def spotify
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
   end
end
