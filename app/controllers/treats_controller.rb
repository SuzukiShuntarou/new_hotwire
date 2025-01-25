class TreatsController < ApplicationController
  before_action :set_treat, only: %i[edit update destroy]

  def index
    @treats = Treat.order(completiondate: :asc).page(params[:page]).per(3)
  end

  def show
    @treat = Treat.find(params[:id])
    @marks = @treat.marks
  end

  def new
    @treat = current_user.treats.new
    @treat.marks.build
  end

  def edit
  end

  def create
    @treat = current_user.treats.new(treat_and_mark_params)
    @treat.marks.each { |mark| mark.user_id = current_user.id }

    if @treat.save
      redirect_to @treat, notice: 'ご褒美の登録に成功！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @treat.update(treat_params)
      flash.now.notice = 'ご褒美の編集に成功！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @treat.destroy

    redirect_to treats_path, notice: 'ご褒美の削除に成功！'
  end

  private

  def treat_params
    params.require(:treat).permit(:completiondate ,:content ,:location)
  end

  def set_treat
    @treat = current_user.treats.find(params[:id])
  end

  def treat_and_mark_params
    params.require(:treat).permit(:completiondate ,:content ,:location, marks_attributes: %i[content progress])
  end
end
