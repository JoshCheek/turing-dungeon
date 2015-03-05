class SessionsController < ApplicationController
  def create
    user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    session[:auth_data] = request.env['omniauth.auth']
    redirect_to user
  end
end
