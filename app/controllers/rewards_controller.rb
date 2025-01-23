class RewardsController < ApplicationController
  before_action :set_reward, only: %i[edit update destroy]

  def index
    @rewards = Reward.order(completiondate: :asc).page(params[:page]).per(3)
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = current_user.rewards.new
  end

  def edit
  end

  def create
    @reward = current_user.rewards.new(reward_params)

    if @reward.save
      redirect_to rewards_path, notice: 'ご褒美の登録に成功！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reward.update(reward_params)
      flash.now.notice = 'ご褒美の編集に成功！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reward.destroy

    redirect_to rewards_path, notice: 'ご褒美の削除に成功！'
  end

  private

  def reward_params
    params.require(:reward).permit(:completiondate ,:content ,:location)
  end

  def set_reward
    @reward = current_user.rewards.find(params[:id])
  end
end
