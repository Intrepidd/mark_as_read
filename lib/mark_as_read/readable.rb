require 'active_support/concern'

module MarkAsRead
  module Readable

    extend ActiveSupport::Concern

    included do
      cattr_accessor :mark_as_read_proc
    end

    module ClassMethods
      def mark_as_read(&block)
        self.mark_as_read_proc = block
      end
    end

    def mark_as_read!
      if self.mark_as_read_proc
        self.mark_as_read_proc.call(self)
      end
    end

  end
end