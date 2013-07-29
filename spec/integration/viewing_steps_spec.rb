require 'spec_helper'
feature "Viewing steps" do
  before do
    textmate_2 = Factory(:goal, :name => "Sleep Early")
    Factory(:step,
            :goal => textmate_2,
            :name => "Make it shiny!")
    internet_explorer = Factory(:goal, :name => "Internet Explorer")
    Factory(:step,
            :goal => internet_explorer,
            :name => "Standards compliance")
    visit '/'
  end

  scenario "Viewing steps for a given goal" do
    click_link "Sleep Early"
    page.should have_content("Make it shiny!")
    page.should_not have_content("Standards compliance")
    click_link "Make it shiny!"
    within("#step h2") do
      page.should have_content("Make it shiny!")
    end
  end
end
