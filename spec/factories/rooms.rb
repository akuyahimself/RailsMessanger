# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    association :user
    title { SecureRandom.hex(3) }
  end
end
