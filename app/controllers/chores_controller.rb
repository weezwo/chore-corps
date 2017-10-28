class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  def index
    @family = Family.find(params[:id])
    render json: @family.chores, include: ['tasks.user']
  end

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
  #  @task = @chore.tasks.build
    render json: @chore, include: ['tasks.user']
  end

  def edit
  end

  def update
    if @chore.update(chore_params)
      redirect_to family_path(@chore.family_id)
    else
      render template: 'chores/edit'
    end
  end

  def destroy
    @chore.delete
    redirect_to family_path(current_family)
  end

  private
  def chore_params
    params.require(:chore).permit(:name, :notes, :cycle, :family_id)
  end

  def set_chore
    @chore = Chore.find(params[:id])
  end
end
