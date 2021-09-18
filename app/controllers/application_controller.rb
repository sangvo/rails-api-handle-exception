class ApplicationController < ActionController::API
  include Rescueable
  include Serializeable
  include Pagy::Backend

  def render_success(data = nil, opts = {}, status = :ok)
    res = { success: true, data: data }
    res[:message] = opts[:message] if opts[:message]
    res[:meta] = opts[:meta] if opts[:meta]

    render json: res.compact, status: status
  end
end
