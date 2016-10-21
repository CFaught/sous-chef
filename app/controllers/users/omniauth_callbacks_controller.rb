class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    try_sign_in
  end

  def twitter
    try_sign_in
  end

  private
  def try_sign_in
    if request.env["omniauth.auth"]["info"]["email"].nil?
      flash["error"] = "No valid email available."
      redirect_to new_user_registration_path
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end
  end
end
