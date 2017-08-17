class UsersController < ApplicationController
  before_action :authenticate_user!, :verify_family

  def show
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def show_complete
    @user = User.find(params[:user_id])
    #@family = current_family
    @family = Family.find(params[:id])
  end
end
