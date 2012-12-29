class Language < ActiveRecord::Base
  
  attr_accessible :logo, :name
  has_attached_file :logo, styles: { big: "300x300>", small: "100x100>", icon: '32x32>' }

  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :learners
  
  def self.match_names(name)
    self.where('name LIKE ?', "%#{name}%").all.map(&:name)
  end
  
end