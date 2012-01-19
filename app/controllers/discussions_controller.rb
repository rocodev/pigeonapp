class DiscussionsController < ApplicationController
  
  before_filter :find_company
  
  def new
    @question = Question.new
  end
  
  protected
  
  def find_company
    @company = Company.find_by_slug(request.subdomain)
  end
end