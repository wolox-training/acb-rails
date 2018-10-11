FactoryBot.define do
  factory :rent do
    from    { Faker::Date.today }
    to      { Faker::Date.forward(2) }
    book    { 1 }
    user    { 1 }
  end
end
