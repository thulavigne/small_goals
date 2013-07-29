require 'spec_helper'
feature "Creating Steps" do
  before do
    Factory(:goal, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Step"
  end

  scenario "Creating a step" do
    fill_in "Name", :with => "Non-standards compliance"
    click_button "Create Step"
    page.should have_content("Step has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Name can't be blank")
  end
end
