require 'spec_helper'


feature 'Creating links' do
  
  scenario 'can create folder' do
    visit '/'
    click_link 'New Folder'
    fill_in 'Name', :with => 'Name of Some Folder'
    click_button 'Create Folder'
    title = 'Name of Some Folder'
    page.should have_content("Your folder #{title} has been created.")
  end
  
  scenario 'cannot create folder without name' do
    visit '/'
    click_link 'New Folder'
    fill_in 'Name', :with => ''
    click_button 'Create Folder'
    page.should have_content("Your folder has not been created.")
  end
  
  scenario 'can create subfolder' do
    Factory(:folder, :name => 'Mother')
    visit '/'
    click_link 'Mother'
    click_link 'Create Subfolder'
    fill_in 'Name', :with => 'Child'
    click_button 'Create Folder'
    page.should have_content("Your folder Child has been created.")
    click_link 'Child'
    page.should have_content("Filed under... Mother")
    
  end
  
end
