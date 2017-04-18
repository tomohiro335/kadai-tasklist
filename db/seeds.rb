# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create(content: 'test task 1', status: 'not yet')

(1..30).each do |number|
  Task.create(content: 'test task' + number.to_s, status: 'not yet')
  Task.create(content: 'test task comp' + number.to_s, status: 'completed')
end