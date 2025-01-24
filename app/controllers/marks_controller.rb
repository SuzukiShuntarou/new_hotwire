class MarksController < ApplicationController
  before_action :set_treat, only: %i[edit update]

  def index
  end

  def show
    @mark = Mark.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
    if @mark.update(mark_params)
      redirect_to treats_path, notice: 'ご褒美の編集に成功！'
      # flash.now.notice = 'ご褒美の編集に成功！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def mark_params
    params.require(:mark).permit(:content ,:progress)
  end

  def set_treat
    @mark = current_user.marks.find(params[:id])
  end
end
