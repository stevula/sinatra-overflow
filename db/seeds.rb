require 'faker'

# authors
author_count = 10

author_count.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password)
end

USERS = User.all

# questions
questions_per_author = 3

USERS.each do |author|
  questions_per_author.times do
    Post.create(
      post_type: "question",
      title: Faker::Hacker.adjective,
      body: Faker::Hacker.say_something_smart,
      author_id: author.id
      )
  end
end

# answers
answers_per_question = 3

Post.where(post_type: "question").each do |question|
  answers_per_question.times do
    Post.create(
      post_type: "answer",
      body: Faker::Hacker.say_something_smart,
      question_id: question.id,
      author_id: USERS.sample.id
      )
  end
end

# comments
comments_per_post = 2

Post.all.each do |post|
  comments_per_post.times do
    Comment.create(
      body: Faker::Hacker.say_something_smart,
      author_id: USERS.sample.id,
      post_id: post.id
      )
  end
end

# votes
avg_votes_per_post = 6

Post.all.each do |post|
  randomized_vote_count = (rand * avg_votes_per_post * 2).round
  randomized_vote_count.times do
    post.votes << Vote.create(
      value: 1,
      post_id: post.id,
      voter_id: USERS.sample.id
      )
  end
  post.save
end

# best answer