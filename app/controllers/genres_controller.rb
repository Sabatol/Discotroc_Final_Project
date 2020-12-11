class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def create 
    @new_genre = Genre.new(name: params[:name])
    if @new_genre.save
      redirect_to genres_path
      flash[:notice_good] = "Un nouveau genre à été créé."
    else
      flash[:notice_bad] = "Le genre désiré n'a pas été créé."
      render 'new'
    end
  end

  def update
    @edit_genre = Genre.find(params[:id])
    post_params = params.require(:genre).permit(:name)
    @edit_genre.update(post_params)
    redirect_to genres_path
  end

  def destroy
    @destroy_genre = Genre.find(params[:id])
    @destroy_genre.destroy
    redirect_to genres_path
  end

end
