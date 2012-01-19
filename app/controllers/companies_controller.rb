# -*- encoding : utf-8 -*-
class CompaniesController < ApplicationController
  def show
    @company = Company.find_by_slug(request.subdomain)
  end
end
