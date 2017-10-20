class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = Post.search(params[:search]).visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.visible.pub_sorted.paginate(:per_page => 10, :page => params[:page])
  	end
  	@categories = Category.all
    @users = User.all
  end

  def show
  	@categories = Category.all
  	@post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  	@comment = Comment.new
  	@comments = Comment.all
  end
end
