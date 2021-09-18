class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    pagy, users = pagy(User.all)

    render_success users, meta: pagy_metadata(pagy)
  end

  # GET /users/1
  def show
    raise_error_with_code :unexpected
    CreateUserService.new(user: @user).call

    # render_success nil, message: "Created successfully!"
    render_success @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    @user.save!
    render_success @user
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    render_success @user
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render_success nil, message: 'Deleted!'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
