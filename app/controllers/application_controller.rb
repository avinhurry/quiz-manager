# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :restricted_permission?, :edit_permission?, :view_permission?

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  # Overwriting the sign in redirect path method
  def after_sign_in_path_for(_resource)
    quizzes_path
  end

  # Adding user_type to the list of permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
  end

  def restricted_permission?
    current_user.user_type == 'restricted_permission'
  end

  def edit_permission?
    current_user.user_type == 'edit_permission'
  end

  def view_permission?
    current_user.user_type == 'view_permission'
  end

  def authorize
    unless edit_permission?
      redirect_to root_path, notice: "You are unable to perform this action as you have #{current_user.user_type.humanize.downcase} only,
        If you believe this is an error please contact support at support@proco.com"
      false
    end
  end
end
