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
      flash.now.notice = '目標の編集に成功！'
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
