class VideosController < ApplicationController

  def index
    @videos = HTTParty.get('https://api.zype.com/videos?app_key=XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf')['response']
  end

  def show
    id = params['id']
    @video = HTTParty.get("https://api.zype.com/videos/#{id}?app_key=XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf")['response']
  end

end
