# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  
  before_filter :find_company
  before_filter :find_question
  
  def create
    @comment = @question.comments.build(params[:comment])
    @comment.user = current_user if current_user
    
    if @comment.save
      redirect_to question_path(@question)
    else
      render :template => "questions/show"
    end
  end
  
  protected
  
  def find_question
    @question = Question.find(params[:question_id])
  end
  
  def find_company
    @company = Company.find_by_slug(request.subdomain)
  end 
  
end
