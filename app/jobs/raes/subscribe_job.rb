# frozen_string_literal: true

module Raes
  class SubscribeJob < ApplicationJob
    def perform(action)
      ActiveRecord::Base.uncached do
        Reducer.call(action)
      end
      GC.start
    end
  end
end
