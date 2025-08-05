class StampsController < ApplicationController
  before_action :set_stampable
  def create
    @stamp = @stampable.stamps.build(stamp_params)
    # if current_user
    # @stamp.user = current_user
    # else
    @stamp.guest_id = cookies[:guest_id]
    # end

    if @stamp.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back fallback_location: root_path }
      end
    else
      redirect_back fallback_location: root_path, alert: "スタンプに失敗しました。"
    end
  end

  def destroy
    @stamp = @stampable.stamps.find(params[:id])
    @stamp.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private

  def set_stampable
    if params[:question_id]
      @stampable = Question.find(params[:question_id])
    elsif params[:question_answer_id]
      @stampable = QuestionAnswer.find(params[:question_answer_id])
    end
    # 「どの投稿に対してスタンプを押すか」をセットする
  end

  def stamp_params
    params.require(:stamp).permit(:stamp_type_id)
  end
end
