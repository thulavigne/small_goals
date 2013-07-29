class GoalsController < ApplicationController

  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_goal, :only => [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Goal has been updated."
      redirect_to @goal
    else
      flash[:alert] = "Goal has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @goal.destroy
    flash[:notice] = "Goal has been deleted."
    redirect_to goals_path
  end

  private
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end
    end

    def find_goal
      @goal = Goal.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The goal you were looking" +
                      " for could not be found."
      redirect_to goals_path
  end
end
