FactoryBot.define do
  factory :event do
    title { "my Event" }
    description { "This is my new private event " }
    date { Date.current + 1 }
    location { "MyString" }
    user {}
  end
end
