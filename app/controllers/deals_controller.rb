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
    @sender = User.find(params[:sender_id])
    @new_deal = Deal.new 
  end 

  def create
    # @sender = User.find(params[:sender_id])
    # @new_deal = Deal.new(sender_id: @sender.id, receiver_id: current_user.id)

    @receiver = User.find(params[:receiver_id])
    @new_deal = Deal.new(receiver_id: @receiver.id, sender_id: current_user.id)

    if @new_deal.save

      # Create an initial deal_content when deal creation, to move in model for FAT models, SKINNY controllers
      sender_library = UserLibrary.find(current_user.user_libraries.first.id)
      receiver_library = UserLibrary.find(params[:user_library_id])
      new_deal_content = DealContent.create(sender_library_id: sender_library.id, receiver_library_id: receiver_library.id, deal_id: @new_deal.id)
      ####
      flash[:notice_good] = "Le deal a bien été créer"
      redirect_to user_library_deal_path(params[:user_library_id], @new_deal.id)
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
