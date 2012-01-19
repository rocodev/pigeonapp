# -*- encoding : utf-8 -*-
class DiscussionsController < ApplicationController
  
  before_filter :find_company
  
  def new
    @question = Question.new
    drop_breadcrumb("提出問題")
  end
  
  def index
    @categories = @company.categories
  end
  
  def show
    @category = Category.find(params[:id])
    @questions = @category.questions
  end
  
  protected
  
  def find_company
    @company = Company.find_by_slug(request.subdomain)
  end
end
