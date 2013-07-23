require 'spec_helper'

feature 'Editing Folders' do
  before do
    Factory(:folder, :name => "Blah Blah Blah")
    visit '/'
    click_link "Blah Blah Blah"
    click_link "Edit Folder"
    
  end
  
  scenario 'updating folder' do
    folder = "Blah Blah Blah"
    page.should_not have_content(folder)
    fill_in 'Name', :with => "Bleh Bleh Bleh"
    click_button "Update Folder"
    page.should have_content("Your folder has been updated.")
  end
  
  scenario 'cannot happen without folder name' do
    fill_in 'Name', :with => ""
    click_button "Update Folder"
    page.should have_content("Your folder has not been updated.")
  end
end
