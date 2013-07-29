require 'spec_helper'
feature "Editing Goals" do
  before do
    sign_in_as!(Factory(:admin_user))
    Factory(:goal, :name => "Sleep Early")
    visit "/"
    click_link "Sleep Early"
    click_link "Edit Goal"
    end

  scenario "Updating a goal" do
    fill_in "Name", :with => "Sleep Early beta"
    click_button "Update Goal"
    page.should have_content("Goal has been updated.")
  end

  scenario "Updating a project with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Goal"
    page.should have_content("Goal has not been updated.")
  end
end
