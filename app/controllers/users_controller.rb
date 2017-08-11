class UsersController < ApplicationController
  before_action :verify_family

  def show
    @user = User.find(params[:id])
  end
end
