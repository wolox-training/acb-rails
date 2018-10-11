FactoryBot.define do
  factory :rent do
    from    { Faker::Date.today }
    to      { Faker::Date.forward(2) }
    book    { create(:book) }
    user    { create(:user) }
  end
end
