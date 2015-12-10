class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :answers, class_name: "Post", foreign_key: :question_id
  belongs_to :question, class_name: "Post"
end
