class FamiliesController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
  end

  private

  def family_params
    params.require(:family).permit(:name, :password, :password_confirmation, :users[:name, :password, :password_confirmation])
  end
end
