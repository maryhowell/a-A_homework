# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Poll.destroy_all
Question.destroy_all
Response.destroy_all
User.destroy_all
AnswerChoice.destroy_all


user1 = User.create!(username: "Kevin")
user2 = User.create!(username: "Mary")
user3 = User.create!(username: "Guacamole the author")

poll1 = Poll.create!(title: "world's greatest poll", author_id: 2)
poll2 = Poll.create!(title: "a terrible poll", author_id: 3)

question1 = Question.create!(question: "What's your favorite banana color?", poll_id: 1)
question2 = Question.create!(question: "Why was your answer to the previous question not orange?", poll_id: 1)
question3 = Question.create!(question: "Why aren't you outside?", poll_id: 2)
question4 = Question.create!(question: "This isn't a question, I just feel sorry for you. Oh, and ?", poll_id: 2)
question5 = Question.create!(question: "Thanks for participating?", poll_id: 2)

answerchoice1 = AnswerChoice.create!(question_id: 1, answer_choice: "No!")
answerchoice2 = AnswerChoice.create!(question_id: 1, answer_choice: "Banana!!")
answerchoice3 = AnswerChoice.create!(question_id: 1, answer_choice: "Sky.")
answerchoice4 = AnswerChoice.create!(question_id: 2, answer_choice: "Cuz!")
answerchoice5 = AnswerChoice.create!(question_id: 2, answer_choice: "Good point idk")
answerchoice6 = AnswerChoice.create!(question_id: 3, answer_choice: "Because I'm Kevin and it'll make me have wrinkles.")
answerchoice7 = AnswerChoice.create!(question_id: 3, answer_choice: "I am outside.")
answerchoice8 = AnswerChoice.create!(question_id: 3, answer_choice: "What's outside? I am a software engineer.")
answerchoice9 = AnswerChoice.create!(question_id: 4, answer_choice: "ok")
answerchoice10 = AnswerChoice.create!(question_id: 5, answer_choice: "no problem")


response1 = Response.create!(user_id: 1, answer_choice_id: 1)
response2 = Response.create!(user_id: 2, answer_choice_id: 5)
response3 = Response.create!(user_id: 3, answer_choice_id: 9)
