class UserController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    #when they click analyze me, sends out requests
  end

end
