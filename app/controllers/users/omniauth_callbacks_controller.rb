class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_fb_user(request.env["omniauth.auth"])
    login('Facebook')
  end
  
  def google_oauth2
    @user = User.find_google_user(request.env["omniauth.auth"])
    login('Google')
  end

  private

  def login(provider)
    session["devise.#{provider.downcase}_data"] = request.env["omniauth.auth"]
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: provider
    sign_in @user, event: :authentication
    redirect_to edit_profile_path    
  end

end