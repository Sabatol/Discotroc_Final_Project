module HomeHelper
    def search_sender_disc_home
        @deal = Deal.all
        deal_content = DealContent.where(deal_id: @deal.ids)
        user = UserLibrary.where(id: deal_content.pluck(:sender_library_id))
        disc = Disc.where(id: user.pluck(:disc_id))
        return disc.last(4)
    end 
end
