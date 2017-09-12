class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :users_index]
  before_action :verify_family, only: [:show, :users_index]
  before_action :set_family, only: [:show, :users_index, :stats]

  def new
    @family = Family.new
    @user = @family.users.build
  end

  def create
    @family = Family.new(family_params)
    user = @family.users.last
    if @family.save
      sign_in(user)
      redirect_to family_path(@family)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def users_index
    @users = @family.users
    render template: 'users/index'
  end

  def stats
  end

  private

  def family_params
    params.require(:family).permit(:name, :password, :password_confirmation, :users_attributes => [:name, :email, :password, :password_confirmation])
  end

  def set_family
    @family = Family.find(params[:id])
  end
end
