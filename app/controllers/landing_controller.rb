class LandingController < ApplicationController
  def index
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    binding.pry
    @media = client.media_popular
  end

  def callback
    response = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'])
    session[:access_token] = response.access_token
    redirect_to root_path
  end
end