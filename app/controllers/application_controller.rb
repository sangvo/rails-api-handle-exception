class ApplicationController < ActionController::API
  include Rescueable
  include Serializeable
  include Pagy::Backend

  def render_json data = nil, meta = nil, status = :ok
    render json: {success: true, data: data, meta: meta}.compact, status: status
  end
end