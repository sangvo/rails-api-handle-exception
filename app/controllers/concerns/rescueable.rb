module Rescueable
  extend ActiveSupport::Concern
  
  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from Errors::BaseError, with: :render_runtime_error_response
  end

  private

  def render_record_not_found_response error
    render json: Errors::ActiveRecordNotFound.new(error).to_hash, status: :not_found
  end

  def render_unprocessable_entity_response error
    render json: Errors::ActiveRecordValidation.new(error.record).to_hash, status: :unprocessable_entity
  end

  def render_runtime_error_response error
    render json: error.to_hash, status: :bad_request
  end
end