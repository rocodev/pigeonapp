class Company < ActiveRecord::Base
  
  has_many :questions
  
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
#    Company.find_by_name(request.subdomain).present?
  end
end
