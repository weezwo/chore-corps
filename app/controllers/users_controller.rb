class UsersController < ApplicationController
  before_action :authenticate_user!, :verify_family

  def show
    @user = User.find(params[:user_id])
    @task = Task.new
  end
end
