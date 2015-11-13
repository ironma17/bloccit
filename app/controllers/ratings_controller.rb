class RatingsController < ApplicationController
  def show
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(rating_params)
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.assign_attributes(rating_params)
  end

  private

  def rating_params
    params.require(:rating).permit(:severity, :rating_id)
  end

end