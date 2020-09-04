# frozen_string_literal: true

module Raes
  module UseCaller
    extend ActiveSupport::Concern

    included do
      private_class_method :new
    end

    class_methods do
      def call(*params)
        new(*params).send(:call)
      end
    end

    private

    def call
      raise NotImplementedError, "You must implement #{self.class}##{__method__}"
    end
  end
end
