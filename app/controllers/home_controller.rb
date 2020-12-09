class HomeController < ApplicationController
  def index
    @four_libraries = UserLibrary.last(4)
  end
end
