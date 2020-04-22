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

Label.create!(
  name: 'sample',
  )

Label.create!(
name: 'sample1',
)

Label.create!(
name: 'sample2',
)

Label.create!(
name: 'sample3',
)

Label.create!(
  name: 'sample4',
  )
