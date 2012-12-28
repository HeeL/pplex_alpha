class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_fb_user(request.env["omniauth.auth"])
    @provider = 'Facebook'
    login_or_reg
  end
  
  def google_oauth2
    @user = User.find_google_user(request.env["omniauth.auth"])
    @provider = 'Google'
    login_or_reg
	end

  private

  def login_or_reg
    @user.persisted? ? login_user : reg_user
  end

  def reg_user
    session["devise.#{@provider.downcase}_data"] = request.env["omniauth.auth"]
    redirect_to edit_profile_path
  end
  
  def login_user
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: @provider
    sign_in @user, event: :authentication
    redirect_to root_path
  end

end