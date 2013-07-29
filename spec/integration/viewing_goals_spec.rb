require 'spec_helper'
feature "Viewing goals" do
  scenario "Listing all goals" do
    goal = Factory.create(:goal, :name => "Sleep Early")
    visit '/'
    click_link 'Sleep Early'
    page.current_url.should == goal_url(goal)
  end
end
