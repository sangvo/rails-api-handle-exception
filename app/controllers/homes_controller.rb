class HomesController < ActionController::API
  def index 
    render json: {status: "ok"}, status: :ok
  end
end