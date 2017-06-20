class MailController < ApplicationController
  def create
    review = Review.new
    review.email = params[:sender]
    review.title = params[:subject]
    review.body = params["stripped-text"]
    review.score = review.body[/.*SCORE:(\d)/] # ugly, but it works
    review.save!
  end
end