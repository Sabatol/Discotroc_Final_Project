module DealsHelper
    def search_pm
    @deal = Deal.find(params[:id])
    @deal_pm = DealPm.where(deal_id: @deal.id)
    return @deal_pm
    end 
end
