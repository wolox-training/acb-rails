FactoryBot.define do
  factory :book do
    author    { Faker::Book.author }
    gender    { Faker::Book.genre }
    image     { 'FakeImage123.gif' }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    release_date { '2018' }
  end
end
