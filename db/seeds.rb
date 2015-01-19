# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create_with(password: '1234', admin: false).find_or_create_by( email: 'user1@foo.com' )
User.find_or_create_by( email: 'admin@foo.com' ) do |user|
  user.password = '1234'
  user.admin = true
  user.save!(validate: false)
end
