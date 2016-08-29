require "ffaker"

FactoryGirl.define do
  factory :backlog do
    name FFaker::Lorem.word
    user
  end
end
