class DiscStatesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show]

  def index
      @discs_state = DiscState.all
  end 
  
  def show
      @disc_state = DiscState.find(params[:id])
  end 
  
  def new
      @new_disc_state = Disc.new 
  end 
  
  def create
      @new_disc_state = DiscState.new(name: params[:name], coefficient: params[:coefficient])
      if @new_disc_state.save
        flash[:notice_good] = "L'état a bien été créer'"
        redirect_to disc_state_path(@new_disc_state.id)
      else
        flash[:notice_bad] = "L'état n'a pas été créer"
        render 'new'
      end
  end
  
  def edit
      @edit_disc_state = DiscState.find(params[:id])
  end
  
    def update
      @edit_disc_state = DiscState.find(params[:id])
      post_params = params.require(:disc_state).permit(:name, :coefficient)
      @edit_disc_state.update(post_params)
      redirect_to disc_state_path(@edit_disc_state.id)
    end
  
    def destroy
      @destroy_disc_state = DiscState.find(params[:id])
      @destroy_disc_state.destroy
      redirect_to disc_states_path
    end
end
