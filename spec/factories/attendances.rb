# frozen_string_literal: true

FactoryBot.define do
  factory :attendance do
    attendee { 'MyString' }
    user { nil }
    event { nil }
  end
end
