# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'securerandom'

20.times do 
	user_id = rand(1..20)
	username =  Faker::Internet.user_name

	User.create(name: Faker::Name.name, email: Faker::Internet.email, username: username, token: SecureRandom.uuid.gsub(/\-/,''))
	2.times do 
		Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: user_id )
	
	3.times do
		Comment.create(user_id: rand(1..20), article_id: rand(1..40), body: Faker::Lorem.paragraph)
	end
	end
end