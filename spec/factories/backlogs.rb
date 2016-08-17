require "ffaker"

FactoryGirl.define do
  factory :backlog do
    name FFaker::Lorem.word
  end
end
