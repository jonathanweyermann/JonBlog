class Comment < ActiveRecord::Base
	belongs_to :post

	validates_presence_of :name, :body

	validates_email_format_of :email, :message => 'please enter a valid email'

	def sub_comments
	  Comment.where(reply_comment: id)
	end
end
