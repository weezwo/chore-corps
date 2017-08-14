class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_family, :calculate_due_date

  def current_family
    current_user.family
  end

  def verify_family
    if User.find(current_user.id).family != Family.find(params[:id])
      redirect_to family_path(current_family), notice: "That is not your family!"
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :family => [:name, :password]) }
  end
end
