class FormatsController < ApplicationController

    before_action :authenticate_user!
    before_action :is_admin?
    def index 
      @formats = Format.all
    end
  
    def show
      @format = Format.find(params[:id])
    end
  
    def new
      @new_format = Format.new
    end
  
    def create 
      @new_format = Format.new(name: params[:name])
      if @new_format.save
        redirect_to formats_path
        flash[:notice_good] = "Nouveau format Crée"
      else
        flash[:notice_bad] = "Le format n'as pas été créer"
        render 'new'
      end
    end
  
    def edit
      @edit_format = Format.find(params[:id])
    end
    
    def update
      @edit_format = Format.find(params[:id])
      post_params = params.require(:format).permit(:name)
      @edit_format.update(post_params)
      redirect_to formats_path
    end
  
    def destroy
      @destroy_format = Format.find(params[:id])
      @destroy_format.destroy
      redirect_to formats_path
    end
  
  end
  
