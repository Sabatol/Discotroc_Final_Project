module DealsHelper
    def search_sender_disc(params)
    deal_content = DealContent.where(deal_id: params.id)
    user = UserLibrary.where(id: deal_content.pluck(:sender_library_id))
    disc = Disc.where(id: user.pluck(:disc_id))
    return disc
    end 


    def search_receiver_disc(params)
        deal_content = DealContent.where(deal_id: params.id)
        user = UserLibrary.where(id: deal_content.pluck(:receiver_library_id))
        disc = Disc.where(id: user.pluck(:disc_id))
        return disc
    end 

    def search_pm
    @deal = Deal.find(params[:id])
    @deal_pm = DealPm.where(deal_id: @deal.id)
    return @deal_pm
    end 


end
