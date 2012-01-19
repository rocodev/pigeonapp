class QuestionsController < ApplicationController
 
  before_filter :find_company
    
  def new
  end
  
  def create
    @question = @company.questions.build(params[:question])
    @question.user = current_user if current_user
    if @question.save
      redirect_to question_path(@question)
    else
      render :template => "discussions/new"
    end
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  protected
  
  def find_company
    @company = Company.find_by_slug(request.subdomain)
  end 
  
end
