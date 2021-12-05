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

  def edit
    @farmer = Farmer.find(params[:id])
  end

  def update
    farmer = Farmer.find(params[:id])
    if farmer.update(farmer_params)
      redirect_to "/farmers/#{farmer.id}"
    else
      redirect_to "/farmers/#{farmer.id}/edit"
    end
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
