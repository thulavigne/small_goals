class StepsController < ApplicationController
before_filter :find_goal
before_filter :find_step, :only => [:show, :edit, :update, :destroy]
before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @step = @goal.steps.build
  end

  def create
    @step = @goal.steps.build(params[:step])
    @step.user = current_user
      if @step.save
        flash[:notice] = "Step has been created."
        redirect_to [@goal, @step]
      else
        flash[:alert] = "Step has not been created."
        render :action => "new"
      end
  end

  def show
  end

  def edit
  end

  def update
    if @step.update_attributes(params[:step])
      flash[:notice] = "Step has been updated."
      redirect_to [@goal, @step]
    else
      flash[:alert] = "Step has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @step.destroy
    flash[:notice] = "Step has been deleted."
    redirect_to @goal
  end

  private
    def find_goal
      @goal = Goal.find(params[:goal_id])
    end

    def find_step
      @step = @goal.steps.find(params[:id])
    end
end
