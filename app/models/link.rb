class Link < ActiveRecord::Base
  attr_accessible :folder, :name, :notes, :subfolder, :url
end
