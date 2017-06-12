class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find
  end

  def new
  end

  def edit
  end
end
