class SessionsController < ApplicationController

  def new

  end

  def create
    if session[:user_id]
      redirect_to '/homepage'
    else
      auth_hash = request.env['omniauth.auth']
      user = User.create_new_user(auth_hash)
      session[:user_id] = auth_hash["uid"]
      redirect_to '/homepage'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


end