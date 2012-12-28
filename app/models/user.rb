class User < ActiveRecord::Base
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, 
                  :uid, :name, :active

  has_and_belongs_to_many :languages
  has_one :teacher, :dependent => :destroy
  has_one :learner, :dependent => :destroy

  default_scope where(active: true)
  
  before_save :create_teacher_learner

  def self.find_fb_user(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
        name: auth.extra.raw_info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0,10]
      )
    end
    user
  end

  def self.find_google_user(data)
    auth = data.info
    user = User.where(email: auth['email']).first
    unless user
      user = User.create(
        name: auth['name'],
        email: auth['email'],
        password: Devise.friendly_token[0,10]
      )
    end
    user
  end
  
  private
  def create_teacher_learner
    self.teacher = Teacher.create
    self.learner = Learner.create
  end
  
end
