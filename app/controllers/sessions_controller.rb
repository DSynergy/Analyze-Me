class SessionsController < ApplicationController
end



# def create
#   user = User.find_or_create_from_auth(request.env['omniauth.auth'])
#
#   if user
#     sessions[:user_id] = user.id
#     redirect_to dashboard_path
#     flash[:alert] = "Welcome"
#   else
#     redirect_to root_path
#     flash[:alert] = "Try Again"
#   end
#
# end
