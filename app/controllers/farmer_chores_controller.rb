class FarmerChoresController < ApplicationController

  def index
    @farmer = Farmer.find(params[:id])
  end

  def new
    @farmer = Farmer.find(params[:id])
  end

  def create
    @farmer = Farmer.find(params[:id])
    farmer_chore = @farmer.chores.create!(fc_params)
    if farmer_chore.save
      redirect_to "/farmers/#{@farmer.id}/chores"
    else
      redirect_to "/farmers/#{@farmer.id}/chores/new"
    end
  end

  private

    def fc_params
      params.permit(:title, :duration, :daily, :farmer_id)
    end
end
