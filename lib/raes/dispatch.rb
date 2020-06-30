# frozen_string_literal: true

module Raes
  class Dispatch
    include UseCaller

    def initialize(name, payload = {})
      @action = Action.create(name: name)
      @payload = payload
    end

    def call
      @action.payload = create_payload.to_json
      SubscribeJob.perform_later(@action) if @action.save
      @action
    end

    def create_payload
      if @payload[:raes_storage].present?
        storage = @action.storages.create(name: @action.name, content: @payload[:raes_storage])
        @payload.delete(:raes_storage)
        @payload[:raes_storage_id] = storage.id
      end
      @payload
    end
  end
end
