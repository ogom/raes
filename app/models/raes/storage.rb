# frozen_string_literal: true

module Raes
  class Storage < ApplicationRecord
    belongs_to :record, polymorphic: true
    has_one_attached :content
    enum status: { created: 0 }
    scope :search, ->(name) { where(name: name.to_s) }
  end
end
