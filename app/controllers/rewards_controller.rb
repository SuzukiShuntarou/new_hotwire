class RewardsController < ApplicationController
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
      redirect_to reward_url(@reward), notice: 'ご褒美の登録に成功！'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def reward_params
    params.require(:reward).permit(:completiondate ,:content ,:location)
  end
end
