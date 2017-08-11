class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_family, :calculate_due_date

  def current_family
    current_user.family
  end

  def verify_family
    User.find(params[:id]).family == current_family
  end

  def calculate_due_date(chore)
    chore.last_completed + chore.cycle
  end
end
