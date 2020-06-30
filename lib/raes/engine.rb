# frozen_string_literal: true

module Raes
  class Engine < ::Rails::Engine
    isolate_namespace Raes

    config.generators do |g|
      g.test_framework :rspec,
                       controller_specs: false,
                       helper_specs: false,
                       request_specs: false,
                       routing_specs: false,
                       view_specs: false
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end
