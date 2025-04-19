# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


status_1 = Status.create! name: 'New'
status_2 = Status.create! name: 'In Progress'
Status.create! name: 'Done'


user_1 = User.create! name: 'John'
user_2 = User.create! name: 'Jack'
User.create! name: 'Usya'


Task.create!(
  name: 'Fix login bug',
  description: 'Login fails on incorrect input',
  user: user_1,
  status: status_1
)

Task.create!(
  name: 'Fix login bug',
  description: 'Login fails on incorrect input',
  user: user_2,
  status: status_2
)