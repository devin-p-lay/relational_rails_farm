class FarmerChoresController < ApplicationController
  before_action :do_farmer

  def index
    if params[:sort]
      @chores = @farmer.chore_order
    elsif params[:duration]
      @chores = @farmer.duration_filter(params[:duration])
    else
      @chores = @farmer.chores
    end
  end

  def new
  end

  def create
    farmer_chore = @farmer.chores.create!(fc_params)
    redirect_to "/farmers/#{@farmer.id}/chores"
  end

  private

    def do_farmer
      @farmer = Farmer.find(params[:id])
    end

    def fc_params
      params.permit(:title, :duration, :daily, :farmer_id)
    end
end
