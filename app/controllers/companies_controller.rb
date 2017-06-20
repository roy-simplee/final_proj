class CompaniesController < ApplicationController
  def index
    @companies = Company.order('review_rating DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @company = Company.find(params[:id])
    @reviews = @company.reviews.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new

  end
end
