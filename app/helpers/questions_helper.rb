# -*- encoding : utf-8 -*-
module QuestionsHelper
  def render_question_subject(question)
    if question.present?
      link_to(question.subject, discussion_question_path(question.category, question) )
    else
      "無"
    end
  end
end
