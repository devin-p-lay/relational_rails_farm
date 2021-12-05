class FarmersController < ApplicationController
  def index
    @farmers = Farmer.order_by_most_recently_created
  end

  def show
    @farmer = Farmer.find(params[:id])
  end

  def new

  end

  def create
    farmer = Farmer.create!(farmer_params)
    if farmer.save
      redirect_to '/farmers'
    else
      redirect_to '/farmers/new'
    end
  end

  private

    def farmer_params
      params.permit(:name, :age, :full_time)
    end
end
