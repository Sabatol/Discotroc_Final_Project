class TracksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index 
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @new_track = Track.new
  end

  def create 
    @new_track = Track.new(name: params[:name])
    if @new_track.save
      redirect_to tracks_path
      flash[:notice_good] = "Nouveau track Crée"
    else
      flash[:notice_bad] = "Le track n'as pas été créer"
      render 'new'
    end
  end

  def edit
    @edit_track = Track.find(params[:id])
  end

  def update
    @edit_track = Track.find(params[:id])
    post_params = params.require(:track).permit(:name)
    @edit_track.update(post_params)
    redirect_to tracks_path
  end

  def destroy
    @destroy_track = Track.find(params[:id])
    @destroy_track.destroy
    redirect_to tracks_path
  end

end
