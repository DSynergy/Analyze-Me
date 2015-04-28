class SessionsController < ApplicationController

  def create
    if auth_provider == "facebook"
      user = User.find_or_create_from_facebook(auth_hash)
    elsif auth_provider == "twitter"
      user = User.find_or_create_from_twitter(auth_hash)
    end

    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:notice] = "You are signed in with #{auth_provider.capitalize}"
    else
      redirect_to root_path
      flash[:alert] = "Something strange happened. Please try again?"
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_provider
    request.env['omniauth.auth']['provider']
  end

end
