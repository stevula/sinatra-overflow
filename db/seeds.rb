require 'faker'
# goal: seed the database in a way that allow us to check for complex scenaris

# Make some users
4.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password)
end

# Make few posts
n = 1
n.times do
  # Create a post object named post
  post = Post.create(post_name: Faker::Hacker.noun)

  1.times do
  post.question << Post.create()
  post.answer << Post.create()
  post.
  post.answer << Post.create()
  post.comments << Comment.create(post_id: n, question: Faker::Hacker.say_something_smart, answer: Faker::Hacker.adjective)

  n += 1
  break if n > 10
  end
end

# we create a bunch of users
