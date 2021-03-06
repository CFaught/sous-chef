class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @recipes = @user.favorites
    redirect_to root_path, alert: "Access denied." unless current_user == @user && !@user.nil?
  end

  def favorites_data
    @user = User.find(params[:id])
    render json: @user
  end

  def shopping
    @items = current_user.items
  end
end
