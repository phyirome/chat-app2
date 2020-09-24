FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room
  
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image1.png'), filename: 'test_image1.png')
  end

  end
end