module StampsHelper
  QUESTION_STAMP_TYPE_IDS = [1, 2] # それ知りたい、わかる
  ANSWER_STAMP_TYPE_IDS   = [3, 4] # 参考になる、いいね


  def stamp_types(stampable)
    if stampable.is_a?(Question)
      StampType.where(id: QUESTION_STAMP_TYPE_IDS)
    else stampable.is_a?(QuestionAnswer)
      StampType.where(id: ANSWER_STAMP_TYPE_IDS)
    end
  end
end
