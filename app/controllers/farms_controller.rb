class FarmsController < ApplicationController
  def index
    @farms = Farm.order_by_most_recently_created
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
  end

  def create
    farm = Farm.create!(farm_params)
    redirect_to '/farms'
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    farm = Farm.find(params[:id])
    farm.update(farm_params)
    redirect_to "/farms/#{farm.id}"
  end

  def destroy
    farm = Farm.find(params[:id])
    farm.destroy
    redirect_to "/farms"
  end

  private

    def farm_params
      params.permit(:name, :acreage, :family_owned)
    end
end