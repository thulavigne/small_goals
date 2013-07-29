require 'spec_helper'

feature 'Creating Goals' do
  scenario "can create a goal" do
    visit '/'
    click_link 'New Goal'
    fill_in 'Name', :with => 'Sleep Early'
    click_button 'Create Goal'
    page.should have_content('Goal has been created.')
    goal = Goal.find_by_name("Sleep Early")
    page.current_url.should == goal_url(goal)
    title = "Sleep Early - My Small Goal"
    find("title").should have_content(title)
  end
end
