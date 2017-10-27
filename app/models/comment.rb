class Comment < ActiveRecord::Base
	belongs_to :post

	def sub_comments
	  Comment.where(reply_comment: id)
	end
end
