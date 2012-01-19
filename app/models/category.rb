# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  belongs_to :company
  has_many :questions
  
  def latest_question
    questions.last
  end
end
