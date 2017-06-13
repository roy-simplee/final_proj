class CompaniesController < ApplicationController
  def index
    @companies = Company.order(:rating).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
  end
end
