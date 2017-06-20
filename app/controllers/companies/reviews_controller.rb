class Companies::ReviewsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @reviews = @company.reviews.order(:company_id).paginate(page: params[:page], per_page: 10)
  end

  def show
    @review = Review.find(params[:id]).includes(:company)
    @company = @review.company
  end
end
