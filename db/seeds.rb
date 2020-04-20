5.times do |n|
  name = Faker::Company::bs

  Label.create!(name: name)
end
