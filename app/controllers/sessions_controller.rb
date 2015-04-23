class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)

    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:alert] = "Welcome Home"
    else
      redirect_to root_path
      flash[:alert] = "Try Again"
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

end
