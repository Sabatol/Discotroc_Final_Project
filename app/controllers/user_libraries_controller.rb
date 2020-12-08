class UserLibrariesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @user_libraries = UserLibrary.all
    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])
  end

  def show
    @user_library = UserLibrary.find(params[:id])
    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])    
  end

  def new
    @new_user_library = UserLibrary.new

  end

  def create
    @new_user_library  = UserLibrary.new(user_id: params[:user_id], disc_id: params[:disc_id], description: params[:description], disc_state_id: params[:disc_state_id])
    if @new_user_library.save
      flash[:notice_good] = "Nouveeau disque ajouté a votre librarie"
      redirect_to user_library_path(@new_user_library)
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
