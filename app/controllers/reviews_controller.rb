class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(:company_id).all
  end

  def show
    @review = Review.find
  end

  def new
  end

  def edit
  end
end
