# frozen_string_literal: true

require 'rails_helper'

module Raes
  RSpec.describe Storage, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to(:record) }
    end
  end
end
