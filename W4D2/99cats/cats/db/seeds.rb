# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.create!(birth_date: Time.now.to_date, color: 'white', name: 'Tupac', sex:'F', description: 'this cat is far too gangta for the average owner')
cat2 = Cat.create!(birth_date: Time.now.to_date, color: 'calico', name: 'Pickels', sex:'F', description: 'this cat will claw your face off')
cat3 = Cat.create!(birth_date: Time.now.to_date, color: 'black', name: 'Sticker', sex:'M', description: 'too cuddly... meows all the time. Will keep you from sleeping')
cat4 = Cat.create!(birth_date: Time.now.to_date, color: 'white', name: 'Snowflake', sex:'F', description: 'Total loner')
cat5 = Cat.create!(birth_date: Time.now.to_date, color: 'tuxedo', name: 'Tuxedo Mask', sex:'M', description: 'Will save Sailor Moon at any chance he gets. i.e. he runs away, he might come back?')
cat6 = Cat.create!(birth_date: Time.now.to_date, color: 'calico', name: 'Mittens', sex:'F', description: 'Is running for president of United Meowsville of Meow Town')
