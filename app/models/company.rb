# -*- encoding : utf-8 -*-
class Company < ActiveRecord::Base
  
  has_many :questions
  has_many :categories
  after_create :create_default_categories
  
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
#    Company.find_by_name(request.subdomain).present?
  end
  
  protected
  
  def create_default_categories
    [["Question", "questions"],["Issue", "issues"],["Suggestion", "suggestions"],["Other", "others"]].each do |option|
      c = categories.build(:name => option[0], :slug => option[1])
      c.save
    end
  end
end
