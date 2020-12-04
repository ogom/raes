# frozen_string_literal: true

module Raes
  class StatelessJob < ApplicationJob
    def perform(name, payload)
      klass = name.constantize
      if klass.instance_method(:initialize).arity.zero?
        klass.call
      else
        klass.call(payload.symbolize_keys)
      end
    end
  end
end
