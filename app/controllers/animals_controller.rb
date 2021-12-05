class AnimalsController < ApplicationController
  def index
    @animals = Animal.rescue_filter
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    redirect_to "/animals/#{animal.id}"
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to "/animals"
  end

  private
    def animal_params
      params.permit(:name, :age, :rescue)
    end
end
