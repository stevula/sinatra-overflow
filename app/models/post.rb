class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question, class_name: "Post"
  has_many :answers, class_name: "Post", foreign_key: :question_id
  has_many :comments
  has_many :votes
end
