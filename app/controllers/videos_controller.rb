class VideosController < ApplicationController

  def index
    @videos = HTTParty.get("https://api.zype.com/videos?app_key=#{ENV['zype_app_key']}")['response']
  end

  def show
    id = params['id']
    @video = HTTParty.get("https://api.zype.com/videos/#{id}?app_key=#{ENV['zype_app_key']}")['response']
  end

end
