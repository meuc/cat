class AudiosController < ApplicationController
  def show
    @cat = Cat.find(params[:cat_id])
    @path = "#{@cat.id}-cat.wav"
    
    username = ENV.fetch("watson_username")
    password = ENV.fetch("watson_password")
    
    worked = system(<<-EOS)
      curl -X POST -u #{username}:#{password} --header "Content-Type: application/json" --header "Accept: audio/wav" --data "{\\"text\\":\\"#{@cat.description}\\"}" --output public/#{@path} "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize"
    EOS
    
    unless worked
      raise "Didn't work"
    end
    
    respond_to do |format|
      format.js
    end
  end
end