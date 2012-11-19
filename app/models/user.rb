class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  # attr_accessible :title, :body

  default_scope where(active: true)

  def self.find_for_facebook_oauth(auth, current_user)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
        name: auth.extra.raw_info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.find_for_google_oauth2(data, current_user)
    auth = data.info
    user = User.where(email: auth['email']).first
    unless user
      user = User.create(
        name: auth['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
  
end
