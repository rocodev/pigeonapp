class QuestionsController < ApplicationController
 
  before_filter :find_company
    
  def new
  end
  
  def create
    @question = @company.questions.build(params[:question])
    if @question.save
      redirect_to question_path(@question)
    else
      render :action => "new"
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
