class FarmAnimalsController < ApplicationController
  before_action :do_farm

  def index
    if params[:sort]
      @animals = @farm.animal_order
    elsif params[:age]
      @animals = Farm.age_filter(params[:age])
    else
      @animals = @farm.animals
    end
  end

  def new
  end

  def create
    farm_animal = @farm.animals.create!(fa_params)
    redirect_to "/farms/#{@farm.id}/animals"
  end

  private

    def do_farm
      @farm = Farm.find(params[:id])
    end

    def fa_params
      params.permit(:name, :age, :rescue, :farm_id)
    end
end
