class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new

    if @comment.save
      flash[:notice] = 'Comment Added'
      	redirect_to post_path(@post)
    else
      binding.pry
      redirect_to post_path(@post), alert: @comment.errors
    end
  end

  private
  	def comment_params
  		params.require(:comment).permit(:name, :email, :body, :post_id, :reply_comment)
	end
end
