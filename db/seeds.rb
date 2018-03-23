# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.reset_pk_sequence
10.times do
  name = Faker::Name.first_name
  password = Faker::HarryPotter.house
  User.create(username:name, password:password)
end


Story.delete_all
Story.reset_pk_sequence
User.all.each do |user|
  content = Faker::HarryPotter.quote
  location = Faker::Address.zip_code
  story = Story.create(content:content, location:location, user_id:user.id)
end


Comment.delete_all
Comment.reset_pk_sequence
Story.all.each do |story|
  2.times do
    content = Faker::Cat.breed
    user = User.all.sample
    Comment.create(content:content, user_id:user.id, story_id:story.id)
  end
end
