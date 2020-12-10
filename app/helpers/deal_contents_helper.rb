module DealContentsHelper
  def is_deal_stakeholder
      deal = Deal.find(params[:deal_id])
      if current_user != deal.sender && current_user != deal.receiver &&  current_user.is_admin? == false
        redirect_to root_path
        flash[:deal_alert] = "Vous ne participez pas à ce troc"
      end
  end
end
