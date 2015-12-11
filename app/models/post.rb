class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question, class_name: "Post"
  has_many :answers, class_name: "Post", foreign_key: :question_id
  has_many :comments
  has_many :votes

  def net_votes
    positive = self.votes.where(value:1).count
    negative = self.votes.where(value:-1).count
    return net = positive - negative
  end

end
