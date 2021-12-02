class FarmersController < ApplicationController
  def index
    @farmers = Farmer.order_by_most_recently_created
  end

  def show
    @farmer = Farmer.find(params[:id])
  end
end
