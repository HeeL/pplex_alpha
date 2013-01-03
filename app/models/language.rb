class Language < ActiveRecord::Base
  
  attr_accessible :name

  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :learners
  
  def self.match_names(name, exact = false)
    name = "%#{name}%" unless exact
    self.where('name LIKE ?', name).all.map(&:name)
  end
  
end