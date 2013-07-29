require 'spec_helper'

feature 'Creating Goals' do
  scenario "can create a goal" do
    visit '/'
    click_link 'New Goal'
    fill_in 'Name', :with => 'Sleep early'
    click_button 'Create Goal'
    page.should have_content('Goal has been created.')
  end
end
