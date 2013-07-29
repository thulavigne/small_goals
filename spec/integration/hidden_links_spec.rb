require 'spec_helper'
feature "hidden links" do
  let(:user) { Factory(:confirmed_user) }
  let(:admin) { Factory(:admin_user) }
  let(:goal) { Factory(:goal) }

  context "anonymous users" do
    scenario "cannot see the New Goal link" do
      visit '/'
      assert_no_link_for "New Goal"
    end

    scenario "cannot see the Edit Goal link" do
      visit goal_path(goal)
      assert_no_link_for "Edit Goal"
    end

    scenario "cannot see the Delete Goal link" do
      visit goal_path(goal)
      assert_no_link_for "Delete Goal"
    end
  end

  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Goal link" do
      visit '/'
      assert_no_link_for "New Goal"
    end

    scenario "cannot see the Edit Goal link" do
      visit goal_path(goal)
      assert_no_link_for "Edit Goal"
    end

    scenario "cannot see the Delete Goal link" do
      visit goal_path(goal)
      assert_no_link_for "Delete Goal"
    end
  end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Goal link" do
      visit '/'
      assert_link_for "New Goal"
    end

    scenario "can see the Edit Goal link" do
      visit goal_path(goal)
      assert_link_for "Edit Goal"
    end

    scenario "can see the Delete Goal link" do
      visit goal_path(goal)
      assert_link_for "Delete Goal"
    end
  end
end
