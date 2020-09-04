# frozen_string_literal: true

module Raes
  class Reducer
    include UseCaller

    def initialize(action)
      @action = action
    end

    def call
      return @action unless @action.queued!

      @action.working!
      @action.state = create_state.to_json
      @action.status = :completed
    rescue StandardError => e
      @action.state = { message: e }
      @action.status = :failed
    ensure
      @action.save!
      @action
    end

    def create_state
      if @action.name.constantize.instance_method(:initialize).arity.zero?
        @action.name.constantize.call
      else
        @action.name.constantize.call(JSON.parse(@action.payload).symbolize_keys)
      end
    end
  end
end
