class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

# Overwriting the sign in redirect path method
  def after_sign_in_path_for(resource)
    quizzes_path
  end
end
