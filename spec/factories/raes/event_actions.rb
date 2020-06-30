# frozen_string_literal: true

FactoryBot.define do
  factory :event_action do
    status { 1 }
    name { 'MyString' }
    payload { {} }
    state { {} }
  end
end
