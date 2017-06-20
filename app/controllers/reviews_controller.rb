class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(:company_id).includes(:company).paginate(page: params[:page], per_page: 10)
  end
end
