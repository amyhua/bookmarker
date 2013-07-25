require 'spec_helper'

feature 'Editing Links' do
  Factory(:folder, :name => "Test Folder")


  before do
    visit '/'
    click_link 'Test Folder'
    click_link "Add a link"
    fill_in 'Title', :with => "Facebook"
    fill_in 'Url', :with => 'facebook.com'
    fill_in 'Notes', :with => "Notes for facebook"
    click_button 'Create Link'
    
  end
  
  scenario 'updating link' do
    click_link 'Edit Link'
    fill_in 'Title', :with => "Bleh Facebook Bleh Bleh"
    click_button "Update Link"
    page.should have_content("Your link has been updated.")
  end
  
  scenario 'cannot update link without both url and title' do
    click_button "Update Link"
    page.should have_content("Your link has not been updated.")
    page.should have_content("Title can't be blank")
    page.should have_content("Url can't be blank")
  end
  
  scenario 'cannot update link with same url as existing link' do
    Factory(:link, :title => "GMail", :url => "http://www.gmail.com", :notes => "Note")
    fill_in 'Url', :with => "www.gmail.com"
    page.should have_content("Your link has not been updated.")
    page.should have_content("Url has been taken")
  end
end
