class Comment < ActiveRecord::Base
	belongs_to :post
	attr_accessor :user_name

	validate :no_robots
	validates_presence_of :name, :body
	validates_email_format_of :email, :message => 'please enter a valid email'

	def sub_comments
	  Comment.where(reply_comment: id)
	end

	def no_robots
		if user_name!='name'
			errors.add(:base, "please don't change any hidden fields")
		end
	end
end
