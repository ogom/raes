# frozen_string_literal: true

FactoryBot.define do
  factory :event_storage do
    status { 1 }
    name { 'MyString' }
    eventable { nil }
  end
end
