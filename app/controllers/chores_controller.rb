class ChoresController < ApplicationController
  def new
    @chore = current_family.chores.build
  end

  def create
    @chore = Chore.create(chore_params)
    redirect_to family_path(current_family)
  end

  def edit
    @chore = chore.find(params[:id])
  end

  private
  def chore_params
    params.require(:chore).permit(:name, :notes, :cycle)
  end
end
