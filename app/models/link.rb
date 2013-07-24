class Link < ActiveRecord::Base
  belongs_to :folders
  
  attr_accessible :notes, :title, :url, :folder
  validates :title, :presence => true
  validates :url, :presence => true
  
end
