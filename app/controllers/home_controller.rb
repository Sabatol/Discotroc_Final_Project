class HomeController < ApplicationController
  def index
    exceptlibrary = UserLibrary.where(disc_id: 1)
    userlibraries = UserLibrary.all - exceptlibrary
    @four_libraries = userlibraries.last(4)
  end
end
