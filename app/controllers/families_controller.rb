class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :verify_family, only: [:show, :users_index]

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    user = @family.users.new(user_params)
    if @family.save && user.save
      sign_in(user)
      redirect_to family_path(@family)
    else
      render :new
    end
  end

  def show
    @user = current_user
    #@family = current_family
    @family = Family.find(params[:id])
  end

  def users_index
    @family = Family.find(params[:id])
    @user = current_user
    @task = @user.tasks.build
    @users = @family.users
    render template: 'users/index'
  end

  private

  def family_params
    params.require(:family).permit(:name, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
