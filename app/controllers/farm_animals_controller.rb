class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:id])
  end

  def new
    @farm = Farm.find(params[:id])
  end

  def create
    @farm = Farm.find(params[:id])
    farm_animal = @farm.animals.create!(fa_params)
    if farm_animal.save
      redirect_to "/farms/#{@farm.id}/animals"
    else
      redirect_to "/farms/#{@farm.id}/animals/new"
    end
  end

  private

    def fa_params
      params.permit(:name, :age, :rescue, :farm_id)
    end
end
