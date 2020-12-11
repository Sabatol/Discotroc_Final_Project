class DealPmsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_completed?

  def create
    @new_deal_pm = DealPm.new(deal_id: params[:deal_id], pm_author_id: params[:pm_author_id], content: params[:content])
    if @new_deal_pm.save
      flash[:notice_good] = "Le message a bien été envoyé."
      redirect_to user_library_deal_path(params[:user_library_id], params[:deal_id])
    else
      flash[:notice_bad] = "Le message n'a pas pu être envoyé."
      render 'new'
    end
  end

  def update

    @edit_deal_pm = DealPm.find(params[:id])
    post_params = params.require(:deal_pm).permit(:deal_id, :pm_author_id, :content)
    @edit_deal_pm.update(post_params)
    redirect_to user_library_deal_path(params[:user_library_id], params[:deal_id])
  end

  def destroy
    @destroy_deal = DealPm.find(params[:id])
    @destroy_deal.destroy
    redirect_to root_path
  end

end
