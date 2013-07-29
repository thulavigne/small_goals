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
      flash[:alert] = "Goal has not been created."
      render :action => "new"
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

end
