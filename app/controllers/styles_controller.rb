class StylesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  def index 
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def new
    @new_style = Style.new
  end

  def create 
    @new_style = Style.new(name: params[:name])
    if @new_style.save
      redirect_to styles_path
      flash[:notice_good] = "Nouveau style Crée"
    else
      flash[:notice_bad] = "Le style n'as pas été créer"
      render 'new'
    end
  end

  def edit
    @edit_style = Style.find(params[:id])
  end
  
  def update
    @edit_style = Style.find(params[:id])
    post_params = params.require(:style).permit(:name)
    @edit_style.update(post_params)
    redirect_to styles_path
  end

  def destroy
    @destroy_style = Style.find(params[:id])
    @destroy_style.destroy
    redirect_to styles_path
  end

end
