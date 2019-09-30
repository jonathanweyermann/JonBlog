class Admin::CommentsController < Admin::ApplicationController
  expose(:comments ) { Post.friendly.find(params[:post_id]).comments }
  expose(:comment)

  def destroy
    if comment.destroy
      flash[:notice] = 'Comment removed'
      redirect_to admin_post_comments_path
    else
      flash[:alert] = 'Could not delete'
    end
  end
end
