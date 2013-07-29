class GoalsController < ApplicationController

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      flash[:notice] = "Goal has been created."
      redirect_to @goal
    else
      # nothing, yet
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

end
