class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @recipes = Recipe.all.find_all { |recipe| recipe.user_id == @user.id }
    redirect_to root_path, alert: "Access denied." unless current_user == @user && !@user.nil?
  end
end
