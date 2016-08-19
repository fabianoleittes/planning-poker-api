require "ffaker"
FactoryGirl.define do
  factory :story do
    description FFaker::Lorem.word
    backlog 1
  end
end
