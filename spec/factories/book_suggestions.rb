FactoryBot.define do
  factory :book_suggestion do
    synopsis  { Faker::Pokemon.move }
    price     { Faker::Commerce.price}
    author    { Faker::Book.author }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year      { '2018' }
    link      { Faker::Internet.url }
    user      { create(:user) }
  end
end
