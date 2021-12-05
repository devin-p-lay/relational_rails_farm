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
    redirect_to '/farmers'
  end

  def edit
    @farmer = Farmer.find(params[:id])
  end

  def update
    farmer = Farmer.find(params[:id])
    farmer.update(farmer_params)
    redirect_to "/farmers/#{farmer.id}"
  end

  def destroy
    farmer = Farmer.find(params[:id])
    farmer.destroy
    redirect_to "/farmers"
  end


  private

    def farmer_params
      params.permit(:name, :age, :full_time)
    end
end
