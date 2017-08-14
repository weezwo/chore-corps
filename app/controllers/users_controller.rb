class UsersController < ApplicationController
  before_action :authenticate_user!, :verify_family

  def show
    @user = User.find(params[:id])
    @task = Task.new
  end
end
