# frozen_string_literal: true

class SimpleEcho < ApplicationInteractor
  def initialize(params)
    @params = params
  end

  def call
    @params
  end
end
