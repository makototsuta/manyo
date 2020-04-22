FactoryBot.define do
  factory :label do
    sequence(:name) { |n| "test_task#{n}" }
  end

  factory :label2 do
    name { 'brand rich niches' }
  end
end
