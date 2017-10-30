class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comment_params)
    @user = User.find(@post.user_id)
    if @comment.save
      flash[:notice] = 'Comment Added'
      redirect_to post_path(@post)
    else
      flash[:alert] = Array(@comment.errors).to_sentence
      render "posts/show"
    end
  end

  private
  	def comment_params
  		params.require(:comment).permit(:name, :email, :body, :post_id, :reply_comment)
	end
end
