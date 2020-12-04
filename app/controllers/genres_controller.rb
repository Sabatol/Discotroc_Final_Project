class GenresController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index 
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @new_genre = Genre.new
  end

  def create 
    @new_genre = Genre.new(name: params[:name])
    if @new_genre.save
      redirect_to genres_path
      flash[:notice_good] = "Nouveau Genre Crée"
    else
      flash[:notice_bad] = "Le genre n'as pas été créer"
      render 'new'
    end
  end

  def edit
    @edit_genre = Genre.find(params[:id])
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
