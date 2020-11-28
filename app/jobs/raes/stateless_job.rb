# frozen_string_literal: true

module Raes
  class StatelessJob < ApplicationJob
    def perform(name, payload)
      ActiveRecord::Base.uncached do
        klass = name.constantize
        if klass.instance_method(:initialize).arity.zero?
          klass.call
        else
          klass.call(payload.symbolize_keys)
        end
      end
      GC.start
    end
  end
end
