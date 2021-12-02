class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

end
