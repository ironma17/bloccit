class RatesController < ApplicationController
  def show
    @rates = Rate.find(params[:id])
  end

  def create
    @rate = Rate.new(rating_params)
  end

  def edit
    @rate = Rate.find(params[:id])
  end
end
