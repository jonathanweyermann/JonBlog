class AddReplyCommentToComment < ActiveRecord::Migration
  def change
    add_column :comments, :reply_comment, :integer
  end
end
