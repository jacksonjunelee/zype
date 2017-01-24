class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user = HTTParty.post("https://login.zype.com/oauth/token/?client_id=61255480307354ebd4d094482f2483adec9942637979aa5c3963ecbac469f943&client_secret=926e632b2aa9758f60dbdf2f8de13bebd9a04dfd602de4c257b3f8b4a97cf0b8&username=#{username}&password=#{password}&grant_type=password")

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
