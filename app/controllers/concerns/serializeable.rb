module Serializeable
  extend ActiveSupport::Concern

  def raise_error_with_code(code_name)
    error_code = I18n.t(code_name, scope: %i[api errors])
    raise Errors::BaseError, error_code
  end
end
