class DealContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_completed?

  def index
    @deal_contents = DealContent.all
  end 

  def show
    @deal_content = DealContent.find(params[:id])
  end 

  def new
    @new_deal_content = DealContent.new 
    @user_library = UserLibrary.all.where(user_id: current_user.id)
  end 

  def create
    @deal = Deal.find(params[:deal_id])
    @receiver_library = UserLibrary.find_by(params[:id])
    @new_deal_content = DealContent.new(sender_library_id: params[:sender_library_id], receiver_library_id: @receiver_library.id, deal_id: @deal.id)
    if @new_deal_content.save
      redirect_to deal_path(params[:deal_id])
      flash[:notice_good] = "Le Content Deal a bien été créer"

    else
      render 'new'
      flash[:notice_bad] = "Le Content Deal n'a pas été créer"
    end
  end

  def edit
    @edit_deal_content = DealContent.find(params[:id])
  end

  def update
    @edit_deal_content = DealContent.find(params[:id])
    post_params = params.require(:deal_content).permit(:sender_library_id, :receiver_library_id, :deal_id)
    @edit_deal_content.update(post_params)
    redirect_to deal_path(params[:deal_id])
  end

  def destroy
    @destroy_deal_content = DealContent.find(params[:id])
    @destroy_deal_content.destroy
    redirect_to root_path
  end 

end
