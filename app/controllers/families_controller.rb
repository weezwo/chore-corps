class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
    redirect_to family_path(@family)
  end

  def show
  end

  private

  def family_params
    params.require(:family).permit(:name, :password, :password_confirmation, :users[:name, :password, :password_confirmation])
  end
end
