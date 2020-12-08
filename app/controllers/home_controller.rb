class HomeController < ApplicationController
  def index
    @four_libraries = UserLibrary.all.sample(4)
  end
end
