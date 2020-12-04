class HomeController < ApplicationController
  def index
    @four_deal = Deal.all.sample(4)
  end
end
