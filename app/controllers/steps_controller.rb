class StepsController < ApplicationController
  def index
    steps2 = User.joins(:steps).where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'")
    @teams = steps2.group(:team).order('average_step DESC').average(:step)
    @users = steps2.group(:user_id).order('sum_step DESC').sum(:step)
    @i = 1
    @j = 1
    @date_feb = Step.where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'")
    #find(:first,:conditions => [ "user_id = ?", :user_id ], :order => "date DESC")
    #Step.where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'").order('date DESC')
  end

  def new
    @step = Step.new
    @steps = Step.where(user_id: current_user.id).where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'").order('date DESC')
    @step_sum = @steps.sum(:step)
    @date_count = 28 - @steps.count(:date)
  end

  def create
    @step = Step.new(step_params)
    @steps = Step.where(user_id: current_user.id).where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'").order('date DESC')
    if @step.save
    redirect_to new_step_path, notice: "登録完了しました"
    else
    redirect_to new_step_path, alert: "入力されていない項目があります"
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    step = Step.find(params[:id])
    step.update(step_params)
    redirect_to new_step_path
  end

  def destroy
    step = Step.find(params[:id])
    step.destroy #予め定義されているdestroyメソッド
    redirect_to new_step_path
  end

  def show
    steps2 = User.joins(:steps).where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'")
    @teams = steps2.group(:team).order('average_step DESC').average(:step)
    @users = steps2.group(:user_id).order('average_step DESC').average(:step)
    @i = 1
    @j = 1
    @date_feb = Step.where("date between '2019-02-01 00:00:00' and '2019-2-28 23:59:59'")
  end

  private
  def step_params
      params.require(:step).permit(:step, :date).merge(user_id: current_user.id)
  end

end
