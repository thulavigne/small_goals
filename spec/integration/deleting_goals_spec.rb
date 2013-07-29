require 'spec_helper'
feature "Deleting goals" do
  scenario "Deleting a goal" do
    Factory(:goal, :name => "Sleep Early")
    visit "/"
    click_link "Sleep Early"
    click_link "Delete Goal"
    page.should have_content("Goal has been deleted.")
    visit "/"
    page.should_not have_content("Sleep Early")
  end
end
