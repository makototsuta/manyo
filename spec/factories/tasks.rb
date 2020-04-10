FactoryBot.define do
  factory :task do
    task_name { 'name' }
    priority { '最優先' }
    status { 'Capybara' }
    user_name { 'user' }
  end
end
