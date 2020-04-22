#5.times do |n|
#  name = Faker::Company::bs

#  Label.create!(name: name)
#end

User.create!(
  name: 'test1',
  email: 'test@example.com',
  admin: false,
  password: 'password',
  password_confirmation: 'password'
  )

User.create!(
  name: 'test2',
  email: 'test2@example.com',
  admin: false,
  password: 'password',
  password_confirmation: 'password'
  )

User.create!(
  name: 'admin1',
  email: 'admin1@example.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
  )

User.create!(
  name: 'admin2',
  email: 'admin2@example.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
  )
