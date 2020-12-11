class DiscsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_completed?, except: [:index, :show]

  def index
    @discs = Disc.all
    @all_genres = Genre.all
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def new
      @new_disc = Disc.new
      @new_user_library = UserLibrary.new
  end

  def create
      @new_disc = Disc.new(title: params[:title], artist: params[:artist], release: params[:release], label: params[:label], genre_id: params[:genre_id], format_id: params[:format_id], country: params[:country])
      if @new_disc.save
        redirect_to edit_disc_path(@new_disc.id)
        flash[:notice_good] = "Le disque a bien été créé."
      else
        flash[:notice_bad] = "Le disque n'a pas été créé."
        render 'new'
      end
  end

  def edit
    @edit_disc = Disc.find(params[:id])
    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])
  end

  def update
    @edit_disc = Disc.find(params[:id])
    post_params =
      params.require(:disc).permit(
        :title,
        :artist,
        :release,
        :label,
        :format_id,
        :genre_id,
        :country,
        :cover_picture
      )
    @edit_disc.update(post_params)
    redirect_to disc_path
  end

  def destroy
    @destroy_disc = Disc.find(params[:id])
    @destroy_disc.destroy
    redirect_to discs_path
  end
end
