class CreateUserService < BaseService
  def initialize user:
    @user = user
  end

  def call
    raise_error_with_code :unexpected if @user.blank?
  end
end