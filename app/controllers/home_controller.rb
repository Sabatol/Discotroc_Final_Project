class HomeController < ApplicationController
  require "discogs"
  def index
    # lines in order to get access to Discogs API and do research directly on Discogs via our app. First it refers to the gem 'discogs-wrapper' then it sets the global variable '$wrapper' used throughout the app to get data from Discogs thanks to our user_token
    @auth_wrapper = Discogs::Wrapper.new('Discotroc', user_token: ENV['USER_TOKEN'])
    @wrapper = Discogs::Wrapper.new('Discotroc')

  end
end
