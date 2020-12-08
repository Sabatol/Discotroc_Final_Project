class DealsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_completed?, except: [:index, :show]
  
  def index
    @deals = Deal.all
  end 

  def show
    @deal = Deal.find(params[:id])
  end 

  def new
    @new_deal = Deal.new 
  end 

  def create
    @new_deal = Deal.new(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    if @new_deal.save
      flash[:notice_good] = "Le deal a bien été créer"
      redirect_to deal_path(@new_deal.id)
    else
      flash[:notice_bad] = "Le disque a bien été créer"
      render 'new'
    end
  end

  def edit
    @edit_deal = Deal.find(params[:id])
  end

  def update
    @edit_deal = Deal.find(params[:id])
    post_params = params.require(:deal).permit(:sender_id, :receiver_id, :sender_ok, :receiver_ok)
    @edit_deal.update(post_params)
    redirect_to deal_path(@edit_deal)
  end

  def destroy
    @destroy_deal = Deal.find(params[:id])
    @destroy_deal.destroy
    redirect_to deals_path
  end 
end
