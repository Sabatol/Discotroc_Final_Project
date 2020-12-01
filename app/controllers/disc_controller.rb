class DiscController < ApplicationController

    def index
        @discs = Disc.all
    end 

    def show
        @disc = Disc.find(params[:id])
    end 

    def new
        @new_disc = Disc.new 
    end 

    def create
        @new_disc = Disc.new(title: params[:title], release: params[:release], code: params[:code], value: params[:value], label: params[:label], format: params[:format], country: params[:country], cover_picture: params[:cover_picture])
        if @new_disc.save
          flash[:notice_good] = "Le disque a bien été créer"
          redirect_to disc_index_path
        else
          flash[:notice_bad] = "Le disque n'a pas été créer"
          render 'new'
        end
    end
    
    def edit
        @edit_disc = Disc.find(params[:id])
    end
    
      def update
        @edit_disc = Disc.find(params[:id])
        post_params = params.require(:disc).permit(:title, :artist_id, :year, :code, :value, :label, :format, :country, :cover_picture)
        @edit_disc.update(post_params)
        redirect_to disc_index_path
      end
    
      def destroy
        @destroy_disc = Disc.find(params[:id])
        @destroy_disc.destroy
        redirect_to root_path
      end
    

end
