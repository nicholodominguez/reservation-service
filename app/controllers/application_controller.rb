class ApplicationController < ActionController::API
  include ActionController::Helpers
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |exception|
    respond_to do |format|
      format.json { render json: { errors: exception.message }, status: :not_found }
    end
  end
end
