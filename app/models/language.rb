class Language < ActiveRecord::Base
  
  attr_accessible :logo, :name
  has_attached_file :logo, :styles => { :big => "300x300>", :small => "100x100>" }
    
  has_and_belongs_to_many :users
  
  
  def self.match_names(name)
    self.where('name LIKE ?', "%#{name}%").all
  end
  
end