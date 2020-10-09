# frozen_string_literal: true

require 'raes/context_logger'

module Raes
  module UseContextLogger
    extend ActiveSupport::Concern

    included do
      def logger
        ContextLogger.new(self.class.name)
      end
    end
  end
end
