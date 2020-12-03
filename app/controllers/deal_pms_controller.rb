class DealPmsController < ApplicationController

  def index
    @deal_pms = DealPm.all
end 

def show
    @deal_pm = DealPm.find(params[:id])
end 

def new
    @new_deal_pm = DealPm.new 
end 

def create
    @new_deal_pm = DealPm.new(deal_id: params[:deal_id], pm_author_id: params[:pm_author_id], content: params[:content])
    if @new_deal_pm.save
      flash[:notice_good] = "Le deal a bien été créer"
      redirect_to deal_pm_path(@new_deal_pm.id)
    else
      flash[:notice_bad] = "Le disque a bien été créer"
      render 'new'
    end
end

def edit
    @edit_deal_pm = DealPm.find(params[:id])
end

  def update
    @edit_deal_pm = DealPm.find(params[:id])
    post_params = params.require(:deal_pm).permit(:deal_id, :pm_author_id, :content)
    @edit_deal_pm.update(post_params)
    redirect_to deal_pm_path(@edit_deal_pm.id)
  end

  def destroy
    @destroy_deal = DealPm.find(params[:id])
    @destroy_deal.destroy
    redirect_to deal_pms_path
    end
     

end
