class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @book = Book.find(params[:book_id])
    @reviews = @book.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to book_reviews_path(@review.ramen_shop)
    else
      @book = Book.find(params[:book_id])
      render "books/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:book_id, :score, :content)
  end
end