class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
  end

  def create
    user = User.find_or_create_by(id: current_user.id)
    MBClassifier.new.categorize_user(user)
    # MBResult.calculate_personality(user)

    if user
      redirect_to user_path(user.id)
      flash[:notice] = "You are an #{current_user.type}!"
    else
      redirect_to user_path(user.id)
      flash[:alert] = "Something strange happened. Please try again?"
    end

  end

  def index
    @users = User.all
  end


end
