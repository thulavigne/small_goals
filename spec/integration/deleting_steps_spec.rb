require 'spec_helper'
feature 'Deleting steps' do
  let!(:goal) { Factory(:goal) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:step) do
    step = Factory(:step, :goal => goal)
    step.update_attribute(:user, user)
    step
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link goal.name
    click_link step.name
  end

  scenario "Deleting a step" do
    click_link "Delete Step"
    page.should have_content("Step has been deleted.")
    page.current_url.should == goal_url(goal)
  end
end
