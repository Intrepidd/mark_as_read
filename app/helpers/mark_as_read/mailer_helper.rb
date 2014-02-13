module MarkAsRead

  module MailerHelper

    def mark_as_read_img(model)
      verifier = ActiveSupport::MessageVerifier.new(Rails.application.config.secret_key_base)
      image_tag(mark_as_read_url(:type => model.class, :id => verifier.generate(model.id)))
    end

  end

end