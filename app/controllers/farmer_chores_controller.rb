class FarmerChoresController < ApplicationController

  def index
    @farmer = Farmer.find(params[:id])
  end
end
