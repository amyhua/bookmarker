class Folder < ActiveRecord::Base
  has_many :links, :dependent => :delete_all
  
  attr_accessible :name, :parent, :parentname 
  serialize :parent
  validates :name, :presence => true, :uniqueness => true
  
end
