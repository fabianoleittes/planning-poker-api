FactoryGirl.define do
  factory :user do
    full_name FFaker::Name.name
    email FFaker::Internet.email
    kind "PO"
  end
end
