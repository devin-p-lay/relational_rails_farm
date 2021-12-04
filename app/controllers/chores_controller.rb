class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    chore = Chore.find(params[:id])
    if chore.update(chore_params)
      redirect_to "/chores/#{chore.id}"
    else
      redirect_to "/chores/#{chore.id}/edit"
    end
  end

  private
    def chore_params
      params.permit(:title, :duration, :daily)
    end

end
