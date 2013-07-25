class Link < ActiveRecord::Base
  belongs_to :folder
  
  attr_accessible :notes, :title, :url, :timestamp
  
  validates :title, :url, :presence => true
  validates :url, :uniqueness => true
  
end
