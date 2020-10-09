# frozen_string_literal: true

class ApplicationInteractor
  include Raes::UseCaller
  include Raes::UseContextLogger
  include Raes::UseStorage
end
