class CompaniesController < ApplicationController
  def index
    @companies = Company.order()
  end

  def show
  end

  def new
  end
end
