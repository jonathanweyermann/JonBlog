class CommentsController < PostsController
  def create
    comment = post.comments.create(comment_params)
    if comment.valid? && comment.save
      flash[:notice] = 'Comment Added'
      session.delete(:comment)
      redirect_to post_path(post, anchor: 'comment')
    else
      session[:comment] = comment
      flash[:alert] = Array(comment.errors).to_sentence
      redirect_to new_post_comment_path(post, comment_id: params["comment"]["reply_comment"], anchor: 'comment')
    end
  end

  private

  def comment_params
  	params.require(:comment).permit(:name, :email, :body, :post_id, :reply_comment)
	end
end
