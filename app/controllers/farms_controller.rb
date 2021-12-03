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

  private

    def farm_params
      params.permit(:name, :acreage, :family_owned)
    end
end