class GoalsController < ApplicationController

  def index
    @goals = Goal.all
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

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Goal has been updated."
      redirect_to @goal
    else
      flash[:alert] = "Goal has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = "Goal has been deleted."
    redirect_to goals_path
  end
end
