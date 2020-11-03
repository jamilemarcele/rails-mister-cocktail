class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @review

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  private

  def set_cocktail
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :name)
  end
end
