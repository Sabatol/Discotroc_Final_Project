class HomeController < ApplicationController
  def index
    userlibraries = UserLibrary.all.without(disc_id: 1)
    @four_libraries = userlibraries.last(4)
  end
end
