module Errors
  class ActiveRecordNotFound < Errors::BaseError
    attr_reader :model, :detail, :message_key

    def initialize error, message: nil
      @model = error.model.underscore
      @detail = error.class.to_s.split("::")[1].underscore
      @errors = serialize
    end

    private

    def message
      I18n.t model, scope: [:api, :errors, :not_found], resource: resource, default: :default
    end

    def resource
      I18n.t model, locale: :api, scope: [:api, :errors, :resources], default: model
    end

    def code
      I18n.t :code, scope: [:api, :errors, :not_found]
    end
  end
end