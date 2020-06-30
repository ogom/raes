# frozen_string_literal: true

module Raes
  class Action < ApplicationRecord
    has_many :storages, as: :record
    enum status: { queued: 0, working: 1, completed: 2, failed: 3 }
    scope :search, ->(name) { where(name: name.to_s) }
  end
end
