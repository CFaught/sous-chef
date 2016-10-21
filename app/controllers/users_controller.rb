class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path, alert: "Access denied." unless current_user == @user
  end
end
