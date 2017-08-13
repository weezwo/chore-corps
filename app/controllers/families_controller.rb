class FamiliesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      user = @family.users.build
      user.update(user_params)
      sign_in(user)
      redirect_to family_path(@family)
    end
  end

  def show
  end

  def users_index
    @family = Family.find(params[:id])
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
