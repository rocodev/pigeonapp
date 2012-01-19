class CommentsController < ApplicationController
  
  before_filter :find_company
  before_filter :find_question
  
  def create
    @comment = @question.comments.build(params[:comment])
    if @comment.save
      redirect_to question_path(@question)
    else
      render :action => "new"
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
