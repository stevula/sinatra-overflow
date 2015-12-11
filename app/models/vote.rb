class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: 'User'
  belongs_to :post
  validates_uniqueness_of :voter_id, scope: :post_id
end
