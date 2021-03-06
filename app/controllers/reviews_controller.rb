class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @dose = Dose.new

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render template: 'cocktails/show'
    end

  end

  private

  def set_cocktail
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :name, :cocktail_id)
  end
end
