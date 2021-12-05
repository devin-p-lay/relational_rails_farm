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
    if farm.save
      redirect_to '/farms'
    else
      redirect_to '/farms/new'
    end
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    farm = Farm.find(params[:id])
    if farm.update(farm_params)
      redirect_to "/farms/#{farm.id}"
    else
      redirect_to "/farms/#{farm.id}/edit"
    end
  end

  private

    def farm_params
      params.permit(:name, :acreage, :family_owned)
    end
end