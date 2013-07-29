require 'spec_helper'

describe GoalsController do
  it "displays an error for a missing goal" do
    get :show, :id => "not-here"
    response.should redirect_to(goals_path)
    message = "The goal you were looking for could not be found."
    flash[:alert].should == message
  end
end
