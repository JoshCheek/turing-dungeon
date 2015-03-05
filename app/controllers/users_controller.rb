class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @auth_data = session[:auth_data]
  end
end
