module Serializeable
  extend ActiveSupport::Concern

  def raise_error_with_code code_name
    error_code = I18n.t(code_name, scope: [:api, :errors])
    raise Errors::BaseError.new(error_code)
  end
end