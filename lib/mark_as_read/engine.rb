require 'rails'

module MarkAsRead
  class Engine < Rails::Engine

    initializer "Add helper to ActionMailer" do
      ActionMailer::Base.helper MarkAsRead::MailerHelper
    end

  end
end