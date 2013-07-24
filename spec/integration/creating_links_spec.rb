require 'spec_helper'


feature 'Creating links' do
  before do
    Factory(:folder, :name => "Test folder")
    visit '/'
    click_link 'Test folder'
    click_link 'Add a link'
  end
  
  scenario 'can create link' do
    fill_in 'Title', :with => 'Name of Some link'
    fill_in 'Url', :with => 'www.somelink.com'
    fill_in 'Notes', :with => 'These are notes for this link'
    click_button 'Create Link'
    title = 'Name of Some link'
    page.should have_content("Your link #{title} has been created.")
  end
  
  scenario 'cannot create link without url and title' do
    fill_in 'Title', :with => ''
    click_button 'Create Link'
    page.should have_content("Your link has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Url can't be blank")
  end
    
end
