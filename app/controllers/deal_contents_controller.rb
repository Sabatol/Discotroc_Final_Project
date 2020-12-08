class DealContentsController < ApplicationController
  before_action :authenticate_user!
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
    @new_deal_content = DealContent.new(sender_library_id: params[:sender_library_id], receiver_library_id: params[:receiver_library_id], deal_id: params[:deal_id])
    if @new_deal_content.save
      flash[:notice_good] = "Le Content Deal a bien été créer"
      redirect_to deal_content_path(@new_deal_content.id)
    else
      flash[:notice_bad] = "Le Content Deal n'a pas été créer"
      render 'new'
    end
end

def edit
    @edit_deal_content = DealContent.find(params[:id])
end

  def update
    @edit_deal_content = DealContent.find(params[:id])
    post_params = params.require(:deal_content).permit(:sender_library_id, :receiver_library_id, :deal_id)
    @edit_deal_content.update(post_params)
    redirect_to deal_content_path(@edit_deal_content.id)
  end

  def destroy
    @destroy_deal_content = DealContent.find(params[:id])
    @destroy_deal_content.destroy
    redirect_to deal_contents_path
  end 

end
