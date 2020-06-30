# frozen_string_literal: true

module Raes
  class SubscribeJob < ApplicationJob
    def perform(action)
      Reducer.call(action)
    end
  end
end
