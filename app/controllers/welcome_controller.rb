class WelcomeController < ApplicationController
  def index
    @comic = JSON.parse(RestClient.get("http://xkcd.com/info.0.json"))
  end
end
