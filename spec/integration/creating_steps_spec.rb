require 'spec_helper'
feature "Creating Steps" do
  before do
    Factory(:goal, :name => "Internet Explorer")
    user = Factory(:user, :email => "ticketee@example.com")
    user.confirm!
    visit '/'
    click_link "Internet Explorer"
    click_link "New Step"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)
    fill_in "Email", :with => "ticketee@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Step") }
  end

  scenario "Creating a step" do
    fill_in "Name", :with => "Non-standards compliance"
    click_button "Create Step"
    page.should have_content("Step has been created.")
    within("#step #author") do
      page.should have_content("Created by ticketee@example.com")
    end
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Name can't be blank")
  end
end
