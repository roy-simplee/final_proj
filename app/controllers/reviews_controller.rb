class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(:company_id).all
  end

  def show
    @review = Review.find(params[:id])
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
