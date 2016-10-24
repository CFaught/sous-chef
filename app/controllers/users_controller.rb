class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @recipes = Recipe.all # TODO change this to favorited recipes or something..
    redirect_to root_path, alert: "Access denied." unless current_user == @user && !@user.nil?
  end
end
