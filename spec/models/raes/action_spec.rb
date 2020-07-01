# frozen_string_literal: true

require 'rails_helper'

module Raes
  RSpec.describe Action, type: :model do
    describe 'associations' do
      it { is_expected.to have_many(:storages) }
    end
  end
end
