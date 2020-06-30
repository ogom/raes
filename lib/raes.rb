# frozen_string_literal: true

require 'raes/engine'
require 'raes/use_caller'
require 'raes/use_storage'
require 'raes/dispatch'
require 'raes/reducer'

module Raes
  def self.dispatch(name, payload = {})
    Dispatch.call(name, payload)
  end

  def self.search(name)
    Action.search(name)
  end
end
