class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { exception.param => t('required') }, status: 422
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { error: exception.message }, status: 422
  end

  def not_found
    render json: { errors: t('error_404_message') }, status: :not_found
  end
end
