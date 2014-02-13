module MarkAsRead
  class MarkAsReadController < ActionController::Base

    def read
      verifier = ActiveSupport::MessageVerifier.new(Rails.application.config.secret_key_base)
      type = params[:type].constantize rescue nil
      raise UnknownType.new("No such type: #{type}") unless type
      raise InvalidType.new("Type #{type} is not a valid model type") unless type.respond_to?(:find)

      model = type.find(verifier.verify(params[:id]))
      raise InvalidType.new("Type #{type} does not include mark_as_read") unless model.respond_to?(:mark_as_read!)
      model.mark_as_read!
      send_data(Base64.decode64("R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="), :type => "image/gif", :disposition => "inline")
    end

  end
end