class ChoresController < ApplicationController
  def new
    @chore = Chore.new
  end

  def create
    @chore = Family.find(params[:id]).chores.build(chore_params)
    if @chore.save
      redirect_to family_path(current_family)
    else
      render template: 'chores/new'
    end
  end

  def show
    @chore = Chore.find(params[:id])
    @task = @chore.tasks.build
  end

  def edit
    @chore = chore.find(params[:id])
  end

  private
  def chore_params
    params.require(:chore).permit(:name, :notes, :cycle, :family_id)
  end
end
