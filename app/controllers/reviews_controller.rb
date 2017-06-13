class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(:company_id).paginate(page: params[:page], per_page: 10)
  end

  def show
    @review = Review.find(params[:id])
    @company = @review.company
  end

  def new
  end

  def edit
  end

  private
  def review_params
    params.require(:review)
  end
end
