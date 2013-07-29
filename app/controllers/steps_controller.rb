class StepsController < ApplicationController
before_filter :find_goal
before_filter :find_goal
before_filter :find_step, :only => [:show, :edit, :update, :destroy]

  def new
    @step = @goal.steps.build
  end

  def create
    @step = @goal.steps.build(params[:step])
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

  private
    def find_goal
      @goal = Goal.find(params[:goal_id])
    end

    def find_step
      @step = @goal.steps.find(params[:id])
    end
end
