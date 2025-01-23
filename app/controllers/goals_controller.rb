class GoalsController < ApplicationController
  before_action :set_goal, only: %i[edit update destroy]

  def index
    @goals = Goal.order(id: :asc).page(params[:page]).per(3)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = current_user.goals.new
  end

  def edit
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goals_path, notice: 'ご褒美の登録に成功！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @goal.update(goal_params)
      flash.now.notice = 'ご褒美の編集に成功！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy

    redirect_to goals_path, notice: 'ご褒美の削除に成功！'
  end

  private

  def goal_params
    params.require(:goal).permit(:content ,:progress)
  end

  def set_goal
    @goal = current_user.goals.find(params[:id])
  end
end
