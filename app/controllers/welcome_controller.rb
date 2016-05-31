class WelcomeController < ApplicationController
  # Render "Comic of the Week" service
  def index
    @comic = JSON.parse(RestClient.get("http://xkcd.com/info.0.json"))
  end
end
