# frozen_string_literal: true

require 'raes/engine'
require 'raes/use_caller'
require 'raes/use_context_logger'
require 'raes/use_storage'
require 'raes/dispatch'
require 'raes/reducer'

module Raes
  def self.config
    @config ||= Rails.application.config_for(:raes)
  rescue StandardError
    @config = {}
  end

  def self.dispatch(name, payload = {})
    Dispatch.call(name, payload)
  end

  def self.search(name)
    Action.search(name)
  end

  def self.stateless(name, payload = {})
    StatelessJob.perform_later(name.to_s, payload)
  end
end
