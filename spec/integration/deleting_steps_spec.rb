require 'spec_helper'
feature 'Deleting steps' do
  let!(:goal) { Factory(:goal) }
  let!(:step) { Factory(:step, :goal => goal) }
  before do
    visit '/'
    click_link goal.name
    click_link step.name
end
  scenario "Deleting a step" do
    click_link "Delete Step"
    page.should have_content("Step has been deleted.")
    page.current_url.should == goal_url(goal)
end end
