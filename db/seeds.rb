# goal: seed the database in a way that allow us to check for complex scenaris
require 'faker'

# Make some users with ids 1,2,3 and 4
4.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password)
end

# Make a few stuff
1.times do

# Create a question asked by user 1 (id == 1):
user_one_post = Post.create(post_type: "question" , title: Faker::Hacker.adjective , body: Faker::Hacker.say_something_smart, best_answer: false, author_id: 1)

# Create a nother question by user 2 (id == 2)
user_two_post = Post.create(post_type: "question", title: Faker::Hacker.adjective , body: Faker::Hacker.say_something_smart, best_answer: false, author_id: 2)

# Create an answer (Post object) to the first question (question_id:1) and specifying the author_id: 2
user_one_post.answers << Post.create(post_type: "answer", title: Faker::Hacker.adjective, body: Faker::Hacker.say_something_smart, best_answer: false, author_id: 2, question_id: 1)

# Create an other answer (Post object) to the question (question_id:1) (still) and specifying the author of this answer author_id: 3
user_one_post.answers << Post.create(post_type: "answer", title: Faker::Hacker.adjective, body: Faker::Hacker.say_something_smart, best_answer: false, author_id: 3, question_id: 1)

# answer the answer created above (in a vanilla world where its id == 3)
comment_to_answer = Comment.create(body: Faker::Hacker.say_something_smart, post_id: 3, author_id: 2)

# answer the original question ques created above (in a vanilla world where its id == 1)
comment_to_question = Comment.create(body: Faker::Hacker.say_something_smart, post_id: 1, author_id: 1)

end
