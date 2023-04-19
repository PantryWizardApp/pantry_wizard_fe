FactoryBot.define do
  factory :user do
    google_id { Faker::Number.number(digits: 10) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    intolerances { ["dairy", "egg"] }
    likes { ["american", "italian"] }
    dislikes { ["greek", "mexican"] }
    dietary_restrictions { "vegetarian" }
  end
end
