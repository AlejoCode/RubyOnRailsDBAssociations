FactoryBot.define do
  factory :user do
    name { "steve" }
    email { "steve@steve.com" }
    password_digest { "123456" }
  end
end
