class CommentsController < PostsController
  def create
  	@post = Post.friendly.find(params[:post_id])
  	#@comment = @post.comments.new(comment_params)
    @user = User.find(@post.user_id)
    current_comment = @post.comments.create(comment_params)
    if current_comment.valid? && current_comment.save
      flash[:notice] = 'Comment Added'
      session.delete(:comment)
    else
      session[:comment] = current_comment
      flash[:alert] = Array(current_comment.errors).to_sentence
    end
    redirect_to post_path(@post, anchor: 'comment')
  end

  private

  def comment_params
  	params.require(:comment).permit(:name, :email, :body, :post_id, :reply_comment)
	end
end
