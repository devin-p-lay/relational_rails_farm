class ChoresController < ApplicationController
  def index
    @chores = Chore.daily_filter
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    chore = Chore.find(params[:id])
    chore.update(chore_params)
    redirect_to "/chores/#{chore.id}"
  end

  def destroy
    chore = Chore.find(params[:id])
    chore.destroy
    redirect_to "/chores"
  end

  private
    def chore_params
      params.permit(:title, :duration, :daily)
    end

end
