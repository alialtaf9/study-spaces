class UsersController < ApplicationController
  def homepage
    @user = User.find_by_facebook_id(session[:user_id])
  end
end