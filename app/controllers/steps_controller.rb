class StepsController < ApplicationController
  def index
    @teams = User.joins(:steps).group(:team).order('average_step DESC').average(:step)
    @users = User.joins(:steps).group(:user_id).order('average_step DESC').average(:step)
    @i = 1
    @j = 1
  end

  def new
    @steps = Step.where(user_id: current_user.id).order('date ASC')
    @step = Step.new
  end

  def create
    step = Step.create(step_params)
    redirect_to new_step_path
  end

  private
  def step_params
      params.require(:step).permit(:step, :date).merge(user_id: current_user.id)
  end

end
