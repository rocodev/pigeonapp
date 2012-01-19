# -*- encoding : utf-8 -*-
module QuestionsHelper
  def render_question_title(question)
    if question.present?
      link_to(question.title, category_question_path(question.category, question) )
    else
      "無"
    end
  end
end
