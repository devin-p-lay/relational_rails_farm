class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:id])
    if params[:sort]
      @animals = @farm.alphamal
    elsif params[:age]
      @animals = @farm.age_filter(params[:age])
    else
      @animals = @farm.animals
    end
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
