require 'spec_helper'


feature 'Creating links' do
  before do
    visit '/'
    click_link 'New Folder'
    
  end
  
  scenario 'can create folder' do
    fill_in 'Name', :with => 'Name of Some Folder'
    click_button 'Create Folder'
    title = 'Name of Some Folder'
    page.should have_content("Your folder #{title} has been created.")
  end
  
  scenario 'cannot create folder without name' do
    fill_in 'Name', :with => ''
    click_button 'Create Folder'
    page.should have_content("Your folder has not been created.")
  end
end
