class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user = HTTParty.post("https://login.zype.com/oauth/token/?client_id=#{ENV['zype_client_id']}&client_secret=#{ENV['zype_client_secret']}&username=#{username}&password=#{password}&grant_type=password")

    binding.pry

    if !user['error']
      session[:current_user_access_token] = user['access_token']
    else
      flash[:errors] = ["#{user['error']}: #{user['error_description']}"]
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    session[:current_user_access_token] = nil
    redirect_back(fallback_location: root_path)
  end

end
