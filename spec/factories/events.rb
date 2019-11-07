FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyString" }
    date { "2019-11-07" }
    location { "MyString" }
    user { nil }
  end
end
