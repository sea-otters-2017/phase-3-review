FactoryGirl.define do
  factory :post do
    guest_name { "My Thoughts" }
    hometown { "Philadelphia" }
    body { Faker::Lorem.paragraph(5) }
  end
end
