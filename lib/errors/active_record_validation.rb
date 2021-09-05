module Errors
  class ActiveRecordValidation < Errors::BaseError
    attr_reader :record

    def initialize record
      @record = record
      @errors = serialize
    end

    def serialize full_messages: true
      messages = record.errors.to_hash full_messages
      record.errors.details.map do |field, details|
        # Show only first errors
        detail = details.first[:error]
        message = messages[field].first
        ValidationErrorSerializer.new(record, field, detail, message).serialize
      end
    end
  end
end