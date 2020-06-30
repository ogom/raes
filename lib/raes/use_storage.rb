# frozen_string_literal: true

module Raes
  module UseStorage
    extend ActiveSupport::Concern

    included do
      attr_accessor :raes_storage_id
    end

    private

    def raes_storage_content
      Storage.find(raes_storage_id).content.download
    end

    def raes_storage_attach(content)
      Storage.find(raes_storage_id).content.attach(content)
    end
  end
end
