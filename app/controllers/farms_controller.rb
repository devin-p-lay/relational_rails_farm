class FarmsController < ApplicationController
  def index
    @farms = Farm.order_by_most_recently_created
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
  end
end