class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question, class_name: "Post"
  has_many :answers, class_name: "Post", foreign_key: :question_id
  has_many :comments
  has_many :votes

  def net_votes
    self.votes.sum(:value)
  end

  def best_answer_to_question
    self.answers.find_by(best_answer:true)
  end
end
