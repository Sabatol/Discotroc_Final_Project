class UserLibrariesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index 
    @user_libraries = UserLibrary.all
  end

  def show
    @user_library = UserLibrary.find(params[:id])
  end

  def new
    @new_user_library = UserLibrary.new
  end

  def create 
    @new_user_library  = UserLibrary.new(user_id: session[:id], disc_id: params[:disc_id], descripion: params[:description])
    if @new_user_library.save
      redirect_to tracks_path
      flash[:notice_good] = "Nouveeau disque ajouté a votre librarie"
    else
      flash[:notice_bad] = "Le disque n'as pas ete ajouté"
      render 'new'
    end
  end

  def edit
    @edit_user_library=UserLibrary.find(params[:id])
  end

  def update
    @edit_user_library=UserLibrary.find(params[:id])
    post_params = params.require(:user_library).permit(user_id: session[:id], disc_id: params[:disc_id], descripion: params[:description])
    @edit_user_library.update(post_params)
    redirect_to user_libraries_path
  end

  def destroy
    @destroy_user_library = UserLibrary.find(params[:id])
    @destroy_user_library.destroy
    redirect_to user_libraries_path
  end

end
