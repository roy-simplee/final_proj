class CompaniesController < ApplicationController
  def index
    @companies = Company.order('review_rating DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
    @company = Company.find(params[:id])
    # @reviews = @company.reviews.order('review_rating DESC').paginate(page: params[:page], per_page: 10)
    @reviews = @company.reviews.paginate(page: params[:page], per_page: 10)
  end

  def new

  end
end
