class ArtistController < ApplicationController

  def index 
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @new_artist = Artist.new
  end

  def create 
    @new_artist = Artist.new(name: params[:name])
    if @new_artist.save
      redirect_to root_path
      flash[:notice_good] = "Nouveau Artiste Crée"
    else
      flash[:notice_bad] = "L'artiste n'as pas été créer"
      render 'new'
    end
  end

  def edit
    @edit_artist = Artist.find(params[:id])
  end
  
  def update
    @edit_artist = Artist.find(params[:id])
    post_params = params.require(:artist).permit(:name)
    @edit_artist.update(post_params)
    redirect_to root_path
  end

  def destroy
    @destroy_artist = Artist.find(params[:id])
    @destroy_artist.destroy
    redirect_to root_path
  end

end
