class User < ActiveRecord::Base
	has_many :posts, foreign_key: :author_id

	# validates :username, :email, :password_hash, presence: true
	# validates :email, uniqueness: true

	# include BCrypt

	# def password
	# 	@password ||= Password.new(password_hash)
	# end

	# def password=(new_password)
	# 	@password = Password.create(new_password)
	# 	self.password_hash = @password
	# end

end
