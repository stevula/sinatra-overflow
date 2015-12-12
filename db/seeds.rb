# goal: seed the database in a way that allow us to check for complex scenarios
require 'faker'

# Make some users with ids 1,2,3 and 4

# authors
author_count = 20

author_count.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password)
end

# questions
question_count = 20

question_count.times do
  Post.create(post_type: "question" , title: Faker::Hacker.adjective , body: Faker::Hacker.say_something_smart, author_id: (rand * author_count + 1).round)
end

# answers
answer_count = 200

answer_count.times do
  Post.create(post_type: "answer", body: Faker::Hacker.say_something_smart, author_id: (rand * author_count + 1).round, question_id: (rand * question_count + 1).round)
end

# comments
comment_count = 300

comment_count.times do
  Comment.create(body: Faker::Hacker.say_something_smart, author_id: (rand * author_count + 1).round, post_id: (rand * comment_count).round)
end

# votes
# Post.all.each do |post|
#   vote_count = (rand * 30).round
#   vote_count.times do
#     post.votes << Vote.create(value: 1, voter_id: (rand * author_count + 1))
#   end
# end
