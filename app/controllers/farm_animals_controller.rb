class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:id])

  end
end
