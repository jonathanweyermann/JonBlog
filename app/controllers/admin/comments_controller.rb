class Admin::CommentsController < Admin::ApplicationController
  before_filter :verify_logged_in
  expose(:comments ) {  Post.find(params[:post_id]).comments }

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_post_comments_path
  end
end
