# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

cat1 = Cat.create!(birth_date: Time.now.to_date, color: 'white', name: 'Tupac', sex:'F', description: 'this cat is far too gangta for the average owner', user_id: 2)
cat2 = Cat.create!(birth_date: Time.now.to_date, color: 'black', name: 'Pickels', sex:'F', description: 'this cat will claw your face off', user_id: 3)
cat3 = Cat.create!(birth_date: Time.now.to_date, color: 'black', name: 'Sticker', sex:'M', description: 'too cuddly... meows all the time. Will keep you from sleeping', user_id: 2)
cat4 = Cat.create!(birth_date: Time.now.to_date, color: 'orange', name: 'Snowflake', sex:'F', description: 'Total loner', user_id: 3)
cat5 = Cat.create!(birth_date: Time.now.to_date, color: 'brown', name: 'Tuxedo Mask', sex:'M', description: 'Will save Sailor Moon at any chance he gets. i.e. he runs away, he might come back?', user_id: 4)
cat6 = Cat.create!(birth_date: Time.now.to_date, color: 'brown', name: 'Mittens', sex:'F', description: 'Is running for president of United Meowsville of Meow Town', user_id: 5)
