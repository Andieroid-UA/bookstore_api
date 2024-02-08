FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { association :author }
  end
end
