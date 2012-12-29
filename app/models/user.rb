class User < ActiveRecord::Base
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, :omniauthable

  attr_accessible :email, :password, :name, :teach, :learn,
                  :learner, :teacher, :teacher_attributes, :learner_attributes

  has_one :teacher, :dependent => :destroy
  has_one :learner, :dependent => :destroy

  accepts_nested_attributes_for :teacher, :learner

  default_scope where(active: true)

  before_create :create_teacher_learner

  validates :name, presence: true, length: {in: 3..30}

  def self.find_fb_user(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
        name: auth.extra.raw_info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0,10]
      )
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
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
