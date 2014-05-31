class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def jawbone
    @user = User.find_for_jawbone_oauth(request.env["omniauth.auth"])

    set_flash_message(:notice, :success, :kind => "Jawbone") if is_navigational_format?
    sign_in_and_redirect @user, :event => :authentication
  end
end
