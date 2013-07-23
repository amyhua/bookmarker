require 'spec_helper'

feature 'Deleting Folders' do
  scenario 'deleting existing folder' do
    Factory(:folder, :name => "Trash")
    visit '/'
    click_link "Trash"
    click_link "Delete Folder"
    page.should have_content("Your folder Trash has been deleted.")
    page.should_not have_link("Trash")
    
  end
end
