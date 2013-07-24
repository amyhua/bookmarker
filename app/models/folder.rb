class Folder < ActiveRecord::Base
  attr_accessible :name, :parent, :parentname 
  serialize :parent
  validates :name, :presence => true, :uniqueness => true
  
end
